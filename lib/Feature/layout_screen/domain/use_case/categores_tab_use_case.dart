import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/sub_category_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/repository/categories_tab_repository.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';

class CategoriesTabUseCase {
  CategoriesTabRepository categoriesTabRepository;

  CategoriesTabUseCase(this.categoriesTabRepository);

  Future<Either<DioFailure, List<SubCategoryEntity>>> call(
      String categoryId) async {
    return await categoriesTabRepository.getAllSubCategories(categoryId);
  }
}
