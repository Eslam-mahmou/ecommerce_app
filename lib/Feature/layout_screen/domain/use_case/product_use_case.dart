import 'package:dartz/dartz.dart';

import 'package:ecommerce_app/Feature/layout_screen/domain/entities/add_wishlist_response_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/product_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/repository/product_repository.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';

import '../entities/add_cart_response_entity.dart';

class ProductUseCase {
  ProductUseCase(this.productRepository);

  ProductRepository productRepository;

  Future<Either<DioFailure, List<ProductEntity>>> callAllProducts({String?q}) async {
    return await productRepository.getAllProducts(q: q);
  }

  Future<Either<DioFailure, ProductEntity>> execute(String productId) async {
    return await productRepository.getSpecificProduct(productId);
  }

  Future<Either<DioFailure, AddCartResponseEntity>> invoke(String productId) {
    return productRepository.addCart(productId);
  }

  Future<Either<DioFailure, AddWishlistResponseEntity>> callProductToWishlist(
      String productId) async {
    return await productRepository.addProductToWishlist(productId);
  }
}