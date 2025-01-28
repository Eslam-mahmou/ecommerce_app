import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/Feature/cart_screen/data/data_source/remote_data_source/cart_remote_data_souce.dart';
import 'package:ecommerce_app/Feature/cart_screen/data/model/get_cart_response_model.dart';
import 'package:ecommerce_app/Feature/cart_screen/domain/entities/get_cart_response_entity.dart';
import 'package:ecommerce_app/Feature/cart_screen/domain/repository/cart_repository.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';

class CartRepositoryImpl implements CartRepository {
  CartBaseRemoteDataSource cartBaseRemoteDataSource;

  CartRepositoryImpl(this.cartBaseRemoteDataSource);

  @override
  Future<Either<DioFailure, GetCartResponseEntity>> getCart() async {
    var response = await cartBaseRemoteDataSource.getCart();
    try {
      if (response.statusCode == 200) {
        var data = GetCartResponseModel.fromJson(response.data);
        return Right(data);
      } else {
        return Left(
            ServerFailure.BadfromResponse(response.statusCode!, response.data));
      }
    } catch (e, s) {
      log(s.toString());
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else if (e is NetworkFailure) {
        return Left(NetworkFailure(e.errorMessage));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<DioFailure, GetCartResponseEntity>> updateCart(
      String productId, num count) async {
    var response = await cartBaseRemoteDataSource.updateCart(productId, count);
    try {
      if (response.statusCode == 200) {
        var data = GetCartResponseModel.fromJson(response.data);
        return Right(data);
      } else {
        return Left(
            ServerFailure.BadfromResponse(response.statusCode!, response.data));
      }
    } catch (e, s) {
      log(s.toString());
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else if (e is NetworkFailure) {
        return Left(NetworkFailure(e.errorMessage));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<DioFailure, GetCartResponseEntity>> deleteCart(String productId)async {
   var response = await cartBaseRemoteDataSource.deleteCart(productId);
   try {
     if(response.statusCode==200){
       var data =GetCartResponseModel.fromJson(response.data);
       return Right(data);
     }else{
       return Left(ServerFailure.BadfromResponse(response.statusCode!, response.data));
     }
   }catch(e,s){
     log(s.toString());
     if(e is DioException){
       return Left(ServerFailure.fromDioError(e));
     }
     else if(e is NetworkFailure){
       return Left(NetworkFailure(e.errorMessage));
     }
     else{
       return Left(ServerFailure(e.toString()));
     }
   }
  }
}
