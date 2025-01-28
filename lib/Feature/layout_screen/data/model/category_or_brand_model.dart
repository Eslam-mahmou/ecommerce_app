import 'package:ecommerce_app/Feature/layout_screen/domain/entities/category_or_brand_entity.dart';

class CategoryOrBrandDM extends CategoryOrBrandEntity {
 const CategoryOrBrandDM(
      {required super.id, required super.name, required super.image,
      super.slug});
  factory CategoryOrBrandDM.fromJson(Map<String,dynamic>json){
    return CategoryOrBrandDM(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      slug: json["slug"]
    );
  }
}
