import 'package:ecommerce_app/Feature/layout_screen/domain/entities/sub_category_entity.dart';

class SubCategoryModel extends SubCategoryEntity {
  SubCategoryModel({required super.id,
    required super.name,
    this.message,
    this.statusMsg,
    super.slug,
    required super.categoryId});
  String?message;
  String? statusMsg;

  factory SubCategoryModel.fromJson(Map<String, dynamic>json){
    return SubCategoryModel(id: json["_id"],
        name: json["name"],
        categoryId: json["category"],
        message: json["message"],
        slug: json["slug"],
        statusMsg: json["statusMsg"]);
  }
}
