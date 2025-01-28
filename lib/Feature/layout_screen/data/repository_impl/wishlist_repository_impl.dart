import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/data_source/remote_data_source/wishlist_tab_remote_data_source.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/model/add_wishlist_response_model.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/model/get_wishlist_response_model.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/add_wishlist_response_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/get_wishlist_response_entity.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';

import '../../domain/repository/wishlist_repository.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  WishlistTabRemoteDataSource wishlist;

  WishlistRepositoryImpl(this.wishlist);

  @override
  Future<Either<DioFailure, GetWishlistResponseEntity>> getWishlist() async {
    var response = await wishlist.getWishlist();
    try {
      if (response.statusCode == 200) {
        var data = GetWishlistResponseModel.fromJson(response.data);
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
  Future<Either<DioFailure, AddWishlistResponseEntity>> deleteWishlist(
      String productId) async {
    var response = await wishlist.deleteWishlist(productId);
    try {
      if (response.statusCode == 200) {
        var data = AddWishlistResponseModel.fromJson(response.data);
        return Right(data);
      } else {
        return Left(
            ServerFailure.BadfromResponse(response.statusCode!, response.data));
      }
    }catch (e, s) {
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
}
