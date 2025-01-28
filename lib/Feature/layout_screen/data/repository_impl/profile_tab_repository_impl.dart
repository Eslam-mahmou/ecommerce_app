import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/data_source/remote_data_source/profile_tab_remote_data_source.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/model/add_address_response_model.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/add_address_response_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/repository/profile_tab_repository.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';

class ProfileTabRepositoryImpl implements ProfileTabRepository {
  ProfileTabRepositoryImpl(this.profileTabRemoteDataSource);

  ProfileTabRemoteDataSource profileTabRemoteDataSource;

  @override
  Future<Either<DioFailure, AddAddressResponseEntity>> addAddress(String home,
      String homeDetails, String phone, String city) async {
    var response = await profileTabRemoteDataSource.addAddress(
        home, homeDetails, phone, city);
    try {
      if (response.statusCode == 200) {
        var data = AddAddressResponseModel.fromJson(response.data);
        return Right(data);
      } else {
        return Left(
            ServerFailure.BadfromResponse(response.statusCode!, response.data));
      }
    } catch (e, s) {
      log(s.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else if (e is NetworkFailure) {
        return left(NetworkFailure(e.errorMessage));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<DioFailure, AddAddressResponseEntity>> getAddress() async {
    var response = await profileTabRemoteDataSource.getAddress();
    try {
      if (response.statusCode == 200) {
        var data = AddAddressResponseModel.fromJson(response.data);
        return Right(data);
      } else {
        return Left(
            ServerFailure.BadfromResponse(response.statusCode!, response.data));
      }
    } catch (e, s) {
      log(s.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else if (e is NetworkFailure) {
        return left(NetworkFailure(e.errorMessage));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<DioFailure, AddAddressResponseEntity>> removeAddress(
      String addressId) async {
    var response = await profileTabRemoteDataSource.removeAddress(addressId);
    try {
      if (response.statusCode == 200) {
        var data = AddAddressResponseModel.fromJson(response.data);
        return Right(data);
      } else {
        return Left(
            ServerFailure.BadfromResponse(response.statusCode!, response.data));
      }
    } catch (e, s) {
      log(s.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else if (e is NetworkFailure) {
        return left(NetworkFailure(e.errorMessage));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }


}
