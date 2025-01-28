import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Feature/cart_screen/domain/entities/get_cart_response_entity.dart';
import 'package:ecommerce_app/Feature/cart_screen/domain/repository/cart_repository.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';

class CartUseCase{
  CartRepository cartRepository;
  CartUseCase(this.cartRepository);
  Future<Either<DioFailure,GetCartResponseEntity>> call()async{
    return await cartRepository.getCart();
  }
  Future<Either<DioFailure,GetCartResponseEntity>> execute(String productId,num count)async{
    return await cartRepository.updateCart(productId,count);
  }
  Future<Either<DioFailure,GetCartResponseEntity>> invoke(String productId)async{
    return await cartRepository.deleteCart(productId);
  }
}