import 'package:equatable/equatable.dart';

class AddCartResponseEntity extends Equatable {
   String status;
 String message;
num numberOfItems ;
String cartId;
AddCartDataEntity data;
AddCartResponseEntity({
  required this.status,
  required this.message,
  required this.numberOfItems,
  required this.cartId,
  required this.data,
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    cartId,
  ];
}
class AddCartDataEntity {
  String id;
 List<AddProductEntity>? products ;
  String createAt ;
  String updatedAt ;
  num totalCartPrice ;
  AddCartDataEntity({
    required this.id,
    required this.products,
    required this.createAt,
    required this.updatedAt,
    required this.totalCartPrice,
  });
}
class AddProductEntity {
  num count ;
  String id;
  String productId;
  num price;
  AddProductEntity({
    required this.count,
    required this.id,
    required this.productId,
    required this.price,
  });
}