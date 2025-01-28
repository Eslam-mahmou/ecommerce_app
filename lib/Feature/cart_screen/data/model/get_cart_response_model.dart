import 'package:ecommerce_app/Feature/layout_screen/data/model/category_or_brand_model.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/model/sub_category_model.dart';

import '../../domain/entities/get_cart_response_entity.dart';

class GetCartResponseModel extends GetCartResponseEntity {
  GetCartResponseModel(
      {super.status,
      super.numOfCartItems,
      super.cartId,
      super.data,
      this.message,
      this.statusMsg});

  String? statusMsg;
  String? message;

  GetCartResponseModel.fromJson(dynamic json) {
    statusMsg = json["statusMsg"]??"";
    message = json["message"]??"";
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
   data=json["data"] !=null ? GetDataCartModel.fromJson(json["data"]) :null;
  }
}

class GetDataCartModel extends GetCartDataEntity {
  GetDataCartModel({
    super.id,
    super.cartOwner,
    super.products,
    super.v,
    super.totalCartPrice,
  });

  GetDataCartModel.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if(json["products"]!=null){
      products=[];
      json["products"].forEach((v) {
        products?.add(GetProductsCartModel.fromJson(v));
      });
    }
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class GetProductsCartModel extends GetProductsCartEntity {
  GetProductsCartModel({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  GetProductsCartModel.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = GetProductModel.fromJson(json["product"]);
    price = json['price'];
  }
}

class GetProductModel extends GetProductEntity {
  GetProductModel({
    super.subcategory,
    super.id,
    super.title,
    super.quantity,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
  });

  GetProductModel.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubCategoryModel.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoryOrBrandDM.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? CategoryOrBrandDM.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }
}
