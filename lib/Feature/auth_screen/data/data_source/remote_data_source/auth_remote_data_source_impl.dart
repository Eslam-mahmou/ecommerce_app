import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/Feature/auth_screen/data/model/login_response_d_m.dart';
import 'package:ecommerce_app/Feature/auth_screen/data/model/register_response_d_m.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';
import 'package:ecommerce_app/core/Services/api_manager.dart';
import 'package:ecommerce_app/core/Services/shared_preference_services.dart';
import 'package:ecommerce_app/core/Utils/constant_manager.dart';
import 'package:ecommerce_app/core/Utils/end_point.dart';
import '../auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<DioFailure, RegisterResponseDM>> signUp(String name,
      String password, String email, String rePassword, String phone) async {
    try {
      var response = await apiManager.postData(EndPoints.register, body: {
        "name": name,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phone
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        var registerResponse = RegisterResponseDM.fromJson(response.data);
        SharedPreferenceServices.saveToken(AppConstants.token, registerResponse.token);
        log(SharedPreferenceServices.getToken(AppConstants.token).toString());
        return right(registerResponse);
      } else {
        return left(
            ServerFailure.BadfromResponse(response.statusCode!,response.data));
      }
    } catch (e,s) {
      log(s.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else if (e is NetworkFailure) {
        return left(NetworkFailure(e.errorMessage));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<DioFailure, LoginResponseDM>> signIn(
      String email, String password) async {
    try {
      var response = await apiManager.postData(EndPoints.login,
          body: {"email": email, "password": password});
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = LoginResponseDM.fromJson(response.data);
        SharedPreferenceServices.saveToken(AppConstants.token, data.token);
        SharedPreferenceServices.getToken(AppConstants.token);
        log(SharedPreferenceServices.getToken(AppConstants.token).toString());
        return right(data);
      } else {
        return left(
            ServerFailure.BadfromResponse(response.statusCode!, response.data));
      }
    } catch (e,s) {
      print(s);
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else if (e is NetworkFailure) {
        return Left(NetworkFailure(e.errorMessage));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
