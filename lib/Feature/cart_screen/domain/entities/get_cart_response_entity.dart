import 'package:ecommerce_app/Feature/layout_screen/domain/entities/category_or_brand_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/sub_category_entity.dart';

class GetCartResponseEntity {
  GetCartResponseEntity({
      this.status, 
      this.numOfCartItems, 
      this.cartId, 
       this.data,});
  String? status;
  num? numOfCartItems;
  String? cartId;
  GetCartDataEntity? data;
}

class GetCartDataEntity {
  GetCartDataEntity({
      this.id,
      this.cartOwner,
      this.products,
      this.v,
      this.totalCartPrice,});
  String? id;
  String? cartOwner;
  List<GetProductsCartEntity>? products;
  num? v;
  num? totalCartPrice;

}

class GetProductsCartEntity {
  GetProductsCartEntity({
      this.count,
      this.id,
      this.product,
      this.price,});
  num? count;
  String? id;
  GetProductEntity? product;
  num? price;

}

class GetProductEntity {
  GetProductEntity({
      this.subcategory, 
      this.id, 
      this.title, 
      this.quantity, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
  });

  List<SubCategoryEntity>? subcategory;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  CategoryOrBrandEntity? category;
  CategoryOrBrandEntity? brand;
  num? ratingsAverage;
}
