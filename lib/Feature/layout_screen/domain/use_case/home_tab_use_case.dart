import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/category_or_brand_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/repository/home_tab_repository.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';

class HomeTabUseCase{
  HomeTabRepository homeTabRepository;
  HomeTabUseCase(this.homeTabRepository);
 Future<Either<DioFailure,List<CategoryOrBrandEntity>>> invoke()async{
    return await homeTabRepository.getAllCategories();
  }
  Future<Either<DioFailure,List<CategoryOrBrandEntity>>> execute()async{
    return await homeTabRepository.getAllBrands();
  }
}