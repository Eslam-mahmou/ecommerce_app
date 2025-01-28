import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/sub_category_entity.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';

abstract class CategoriesTabRepository{
  Future<Either<DioFailure,List<SubCategoryEntity>>>getAllSubCategories(String categoryId);
}