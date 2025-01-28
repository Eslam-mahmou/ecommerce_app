import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/add_wishlist_response_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/get_wishlist_response_entity.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';

import '../repository/wishlist_repository.dart';

class GetWishlistUseCase {
  WishlistRepository getWishlistRepository;

  GetWishlistUseCase(this.getWishlistRepository);

  Future<Either<DioFailure, GetWishlistResponseEntity>> call() async {
    return await getWishlistRepository.getWishlist();
  }

  Future<Either<DioFailure, AddWishlistResponseEntity>> deleteWishlist(
      String productId) async {
    return await getWishlistRepository.deleteWishlist(productId);
  }
}
