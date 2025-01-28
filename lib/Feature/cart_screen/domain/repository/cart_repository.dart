import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Feature/cart_screen/domain/entities/get_cart_response_entity.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';

abstract class CartRepository{
  Future<Either<DioFailure,GetCartResponseEntity>> getCart();
  Future<Either<DioFailure,GetCartResponseEntity>> updateCart(String productId,num count);
  Future<Either<DioFailure,GetCartResponseEntity>> deleteCart(String productId);
}