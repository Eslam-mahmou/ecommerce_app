
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/add_wishlist_response_entity.dart';

import '../../../domain/entities/add_cart_response_entity.dart';
import '../../../domain/entities/product_entity.dart';

abstract class ProductState{

}
class InitialProductState extends ProductState{

}
class LoadingProductState extends ProductState{

}
class SuccessProductState extends ProductState{
List<ProductEntity> products;
SuccessProductState(this.products);
}
class FailureProductState extends ProductState{
final String errMessage;
FailureProductState(this.errMessage);
}
class LoadingAddCartState extends ProductState{

}
class SuccessAddCartState extends ProductState{
  AddCartResponseEntity cart;
SuccessAddCartState(this.cart);
}
class FailureAddCartState extends ProductState{
  final String errMessage;
  FailureAddCartState(this.errMessage);
}
class SeeBadgesState extends ProductState {

}
class LoadingAddWishlistState extends ProductState{

}
class SuccessAddWishlistState extends ProductState{
  AddWishlistResponseEntity wishlist;
  SuccessAddWishlistState(this.wishlist);
}
class FailureAddWishlistState extends ProductState{
  final String errMessage;
  FailureAddWishlistState(this.errMessage);
}