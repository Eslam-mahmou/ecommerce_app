import 'package:ecommerce_app/Feature/layout_screen/domain/entities/add_wishlist_response_entity.dart';

class AddWishlistResponseModel extends AddWishlistResponseEntity {
  AddWishlistResponseModel(
      {required super.statusMessage,
      required super.message,
      required super.data});

  factory AddWishlistResponseModel.fromJson(Map<String, dynamic> json) {
    return AddWishlistResponseModel(
        statusMessage: json['status'],
        message: json['message'],
        data: json['data']);
  }

}
