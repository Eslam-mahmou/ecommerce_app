import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/product_entity.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';

import '../entities/add_cart_response_entity.dart';
import '../entities/add_wishlist_response_entity.dart';

abstract class ProductRepository{
  Future<Either<DioFailure,List<ProductEntity>>> getAllProducts({String ?q});
  Future<Either<DioFailure,ProductEntity>> getSpecificProduct(String productId);
  Future<Either<DioFailure,AddCartResponseEntity>> addCart(String productId);
  Future<Either<DioFailure, AddWishlistResponseEntity>> addProductToWishlist(
      String productId);
}