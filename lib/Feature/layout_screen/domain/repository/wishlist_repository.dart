import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/add_wishlist_response_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/get_wishlist_response_entity.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';

abstract class WishlistRepository {
  Future<Either<DioFailure, GetWishlistResponseEntity>> getWishlist();
  Future<Either<DioFailure, AddWishlistResponseEntity>> deleteWishlist(String productId);
}
