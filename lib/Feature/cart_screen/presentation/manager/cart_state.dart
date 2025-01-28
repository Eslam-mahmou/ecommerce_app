
import 'package:ecommerce_app/Feature/cart_screen/domain/entities/get_cart_response_entity.dart';

abstract class CartState{

}
class InitialGetCartState extends CartState{

}
class LoadingGetCartState extends CartState{

}
class SuccessGetCartState extends CartState{
GetCartResponseEntity allCart;
SuccessGetCartState(this.allCart);
}
class FailureGetCartState extends CartState{
final String errMessage;
FailureGetCartState(this.errMessage);
}
class LoadingUpdateCartState extends CartState{}
class FailureUpdateCartState extends CartState{
  final String errMessage;
  FailureUpdateCartState(this.errMessage);
}
class SuccessUpdateCartState extends CartState{
  GetCartResponseEntity allCart;
  SuccessUpdateCartState(this.allCart);
}
class IncrementCartState extends CartState{

}
class DecrementCartState extends CartState{

}
class LoadingDeleteCartState extends CartState{}
class FailureDeleteCartState extends CartState{
  final String errMessage;
  FailureDeleteCartState(this.errMessage);
}
class SuccessDeleteCartState extends CartState{
}
