
import '../../domain/entities/add_cart_response_entity.dart';

class AddCartResponseModel extends AddCartResponseEntity {
  AddCartResponseModel(
      {required super.status,
      required super.message,
      required super.cartId,
      required super.numberOfItems,
      required super.data,
      this.statusMsg});

  String? statusMsg;

  factory AddCartResponseModel.fromJson(Map<String, dynamic> json) {
    return AddCartResponseModel(
        status: json["status"],
        statusMsg: json["statusMsg"],
        message: json['message'],
        numberOfItems: json['numOfCartItems'],
        cartId: json['cartId'],
        data: AddCartDataModel.fromJson(json["data"]));
  }
}

class AddCartDataModel extends AddCartDataEntity {
  AddCartDataModel({
    required super.id,
    required this.cartOwner,
    required super.products,
    required super.createAt,
    required super.updatedAt,
    required this.v,
    required super.totalCartPrice,
  });

  String cartOwner;
  num v;

  factory AddCartDataModel.fromJson(Map<String, dynamic> json) {
    return AddCartDataModel(
      id: json['_id'],
      cartOwner: json['cartOwner'],
      products: json['products'].forEach((v) {
       AddProductsModel.fromJson(v);
      }),
      createAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
      totalCartPrice: json['totalCartPrice'],
    );
  }
}

class AddProductsModel extends AddProductEntity {
  AddProductsModel({
    required super.count,
    required super.id,
    required super.productId,
    required super.price,
  });

  factory AddProductsModel.fromJson(Map<String, dynamic> json) {
    return AddProductsModel(
      count: json['count'],
      productId: json['product'],
      price: json['price'],
      id: json['_id'],
    );
  }
}
