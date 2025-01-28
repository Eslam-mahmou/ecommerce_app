import 'package:equatable/equatable.dart';

class SubCategoryEntity extends Equatable {
  String id;
  String name;
  String categoryId;
  String ?slug;
  SubCategoryEntity({
    required this.id,
    required this.name,
    required this.categoryId,
    this.slug
  });
  @override
  List<Object?> get props =>
      [
        id,
        name,
        categoryId
      ];

}