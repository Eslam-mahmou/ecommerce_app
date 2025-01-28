


import 'package:ecommerce_app/Feature/layout_screen/domain/entities/add_address_response_entity.dart';

abstract class ProfileTabState{

}
class InitialProfileTabState extends ProfileTabState{

}
class LoadingProfileTabState extends ProfileTabState{

}
class FailureProfileTabState extends ProfileTabState{
  final String errMessage;
  FailureProfileTabState(this.errMessage);
}
class SuccessProfileTabState extends ProfileTabState{
// final String image;
// SuccessProfileTabState(this.image);
}
class LoadingAddressState extends ProfileTabState{

}
class FailureAddressState extends ProfileTabState{
final String errMessage;
 FailureAddressState(this.errMessage);
}
class SuccessAddressState extends ProfileTabState{
AddAddressResponseEntity response;
 SuccessAddressState(this.response);
}
class LoadingGetAddressState extends ProfileTabState{

}
class FailureGetAddressState extends ProfileTabState{
  final String errMessage;
  FailureGetAddressState(this.errMessage);
}
class SuccessGetAddressState extends ProfileTabState{
  AddAddressResponseEntity response;
  SuccessGetAddressState(this.response);
}
class LoadingRemoveAddressState extends ProfileTabState{

}
class FailureRemoveAddressState extends ProfileTabState{
  final String errMessage;
  FailureRemoveAddressState(this.errMessage);
}
class SuccessRemoveAddressState extends ProfileTabState{
  AddAddressResponseEntity response;
  SuccessRemoveAddressState(this.response);
}