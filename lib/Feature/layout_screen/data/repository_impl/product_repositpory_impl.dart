import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/data_source/remote_data_source/product_remote_data_source.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/model/add_wishlist_response_model.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/model/product_model.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/add_wishlist_response_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/product_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/repository/product_repository.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';

import '../../domain/entities/add_cart_response_entity.dart';
import '../model/add_cart_response_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this.baseProductRemoteDataSource);

  BaseProductRemoteDataSource baseProductRemoteDataSource;

  @override
  Future<Either<DioFailure, List<ProductEntity>>> getAllProducts({String? q}) async {
    var response = await baseProductRemoteDataSource.getAllProducts(q: q);
    try {
      List<ProductEntity> products = [];
      if (response.statusCode == 200) {
        var data = response.data["data"];
        for (var element in data) {
          products.add(ProductResponseDM.fromJson(element));
        }
        return Right(products);
      } else {
        return Left(
            ServerFailure.BadfromResponse(response.statusCode!, response.data));
      }
    } catch (e) {
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
  Future<Either<DioFailure, ProductEntity>> getSpecificProduct(
      String productId) async {
    var response =
    await baseProductRemoteDataSource.getSpecificProduct(productId);
    print("response :- $response");
    try {
      if (response.statusCode == 200) {
        var data = ProductResponseDM.fromJson(response.data["data"]);
        print("data :-$data");
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
  Future<Either<DioFailure, AddCartResponseEntity>> addCart(
      String productId) async {
    var response = await baseProductRemoteDataSource.addCart(productId);
    try {
      if (response.statusCode == 200) {
        var data = AddCartResponseModel.fromJson(response.data);
        return right(data);
      }
      else {
        return left(
            ServerFailure.BadfromResponse(response.statusCode!, response.data));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      else if (e is NetworkFailure) {
        return left(NetworkFailure(e.errorMessage));
      }
      else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<DioFailure, AddWishlistResponseEntity>> addProductToWishlist(
      String productId) async {
    var response = await baseProductRemoteDataSource.addWishlist(productId);
    try {
      if (response.statusCode == 200) {
        var data = AddWishlistResponseModel.fromJson(response.data);
        return Right(data);
      }
      else {
        return Left(
            ServerFailure.BadfromResponse(response.statusCode!, response.data));
      }
    }
    catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      else if (e is NetworkFailure) {
        return left(NetworkFailure(e.errorMessage));
      }
      else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}