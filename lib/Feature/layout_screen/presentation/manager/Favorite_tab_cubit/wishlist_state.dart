import '../../../domain/entities/get_wishlist_response_entity.dart';

abstract class WishlistState {}

class InitialWishlistState extends WishlistState {}

class LoadingWishlistState extends WishlistState {}

class SuccessWishlistState extends WishlistState {
  List<GetDataWishlistEntity> wishlist;

  SuccessWishlistState(this.wishlist);
}

class FailureWishlistState extends WishlistState {
  final String errMessage;

  FailureWishlistState(this.errMessage);
}
class LoadingDeleteWishlistState extends WishlistState {}

class SuccessDeleteWishlistState extends WishlistState {
}

class FailureDeleteWishlistState extends WishlistState {
  final String errMessage;
  FailureDeleteWishlistState(this.errMessage);
}
