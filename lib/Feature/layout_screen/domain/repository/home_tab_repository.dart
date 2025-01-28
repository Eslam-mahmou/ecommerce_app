import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/category_or_brand_entity.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';

abstract class HomeTabRepository{
  Future<Either<DioFailure,List<CategoryOrBrandEntity>>> getAllCategories();
  Future<Either<DioFailure,List<CategoryOrBrandEntity>>> getAllBrands();

}