import 'package:ecommerce_app/Feature/layout_screen/data/model/category_or_brand_model.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/category_or_brand_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/get_wishlist_response_entity.dart';

class GetWishlistResponseModel extends GetWishlistResponseEntity {
  GetWishlistResponseModel({ super.status,
     super.count,
     super.data,
    this.statusMessage,
    this.message});

   String? statusMessage;

   String? message;

  GetWishlistResponseModel.fromJson(Map<String, dynamic> json) {
    status =json["status"];
    statusMessage = json['status'];
    message = json['message'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(GetDataWishlistModel.fromJson(v));
      });
    }
  }
}
  class GetDataWishlistModel extends GetDataWishlistEntity {
  GetDataWishlistModel(
  { super.sold,
   super.images,
   super.subcategories,
   super.ratingsQuantity,
   super.title,
   super.price,
   super.id,
   super.description,
   super.slug,
   super.imageCover,
   super.quantity,
   super.category,
   super.brand,
   super.ratingAverage});

  GetDataWishlistModel.fromJson(Map<String, dynamic> json) {
  sold= json["sold"];
  images= json["images"];
  subcategories= json["subcategory"];
  ratingsQuantity= json["ratingsQuantity"];
  title= json["title"];
  price= json["price"];
  id= json["_id"];
  description= json["description"];
  slug= json["slug"];
  imageCover= json["imageCover"];
  quantity= json["quantity"];
  category= CategoryOrBrandDM.fromJson(json["category"]);
  brand= CategoryOrBrandDM.fromJson(json["brand"]);
  ratingAverage= json["ratingsAverage"];
  }
  }
