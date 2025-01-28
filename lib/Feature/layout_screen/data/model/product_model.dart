import 'package:ecommerce_app/Feature/layout_screen/domain/entities/product_entity.dart';

class ProductResponseDM extends ProductEntity {
  ProductResponseDM({required super.id,
    required super.sold,
    required super.images,
    required super.subCategories,
    required super.ratingsQuantity,
    required super.description,
    required super.title,
    required super.quantity,
    required super.price,
    // required super.category,
    // required super.brand,
    required super.ratingsAverage,
    required super.imageCover,
    this.message,
    this.statusMsg});

  final String ?statusMsg;
  final String? message;

  factory ProductResponseDM.fromJson(Map<String, dynamic> json){
    return ProductResponseDM(id: json["id"] ??"",
        sold: json["sold"]??0,
        images: json["images"]??[],
        subCategories: json["subcategory"]??[],
        ratingsQuantity: json["ratingsQuantity"]??0,
        description: json["description"],
        title: json["title"],
        quantity: json["quantity"]??0,
        price: json["price"]??0,
        // category: json["category"],
        // brand: json["brand"],
        ratingsAverage: json["ratingsAverage"]??0,
        imageCover: json["imageCover"]??"",
    statusMsg:json["statusMsg"] ,
    message:json["message"] );
  }
}
