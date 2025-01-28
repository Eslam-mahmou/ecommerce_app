import 'package:ecommerce_app/Feature/layout_screen/domain/entities/category_or_brand_entity.dart';
import 'package:equatable/equatable.dart';

class GetWishlistResponseEntity extends Equatable{
  String? status ;
  num? count ;
  List<GetDataWishlistEntity>? data;
  GetWishlistResponseEntity({
     this.status,
     this.count,
     this.data,
  });
  @override
  List<Object?> get props => [
    data
  ];
}
class GetDataWishlistEntity {
  num? sold;
  List<dynamic>? images ;
  List<dynamic>? subcategories ;
  num? ratingsQuantity ;
  String? title;
  num? price;
  String? id;
  String? description;
  String? slug;
  String? imageCover;
  num? quantity;
  CategoryOrBrandEntity? category;
  CategoryOrBrandEntity? brand;
  num? ratingAverage ;
  GetDataWishlistEntity(
  {
     this.sold,
     this.images,
     this.subcategories,
     this.ratingsQuantity,
     this.title,
     this.price,
     this.id,
     this.description,
     this.slug,
     this.imageCover,
     this.quantity,
     this.category,
     this.brand,
     this.ratingAverage,
  });
}