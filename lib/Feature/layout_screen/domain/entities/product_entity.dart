import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable{
  String ?id;
  num? sold;
  List<dynamic>? images;
List<dynamic>? subCategories;
  int? ratingsQuantity;
  String? description;
  String? title;
  num? quantity;
  num? price;
  // CategoryOrBrandEntity category;
  // CategoryOrBrandEntity brand;
  num? ratingsAverage;
  String? imageCover;
  ProductEntity({
    required this.id,
    required this.sold,
    required this.images,
    required this.subCategories,
    required this.ratingsQuantity,
    required this.description,
    required this.title,
    required this.quantity,
    required this.price,
    // required this.category,
    // required this.brand,
    required this.ratingsAverage,
    required this.imageCover,
  });

  @override
  List<Object?> get props =>
      [
     id,
     imageCover
      ];



}