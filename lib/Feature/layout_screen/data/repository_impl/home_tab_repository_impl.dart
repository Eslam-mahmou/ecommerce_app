import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/model/category_or_brand_model.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/category_or_brand_entity.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';

import '../../domain/repository/home_tab_repository.dart';
import '../data_source/home_tab_remote_data_source.dart';

class HomeTabRepositoryImpl implements HomeTabRepository {
  HomeTabRemoteDataSource homeTabRemoteDataSource;
  HomeTabRepositoryImpl(this.homeTabRemoteDataSource);
  @override
  Future<Either<DioFailure, List<CategoryOrBrandEntity>>>
      getAllCategories() async {
    try {
      final response = await homeTabRemoteDataSource.getAllCategories();
      List<CategoryOrBrandEntity> categoriesList = [];
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = response.data["data"];

        for (var element in data) {
          categoriesList.add(CategoryOrBrandDM.fromJson(element));
        }
        return Right(categoriesList);
      } else {
        return Left(
            ServerFailure.BadfromResponse(response.statusCode!, response.data));
      }
    } catch (e,s) {

      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else if (e is NetworkFailure) {
        return Left(NetworkFailure(e.errorMessage));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<DioFailure, List<CategoryOrBrandEntity>>> getAllBrands() async{
    try {
      final response = await homeTabRemoteDataSource.getAllBrands();
      List<CategoryOrBrandEntity> categoriesList = [];
      if (response.statusCode == 200) {
        var data = response.data["data"];
        for (var element in data) {
          categoriesList.add(CategoryOrBrandDM.fromJson(element));
        }
        return Right(categoriesList);
      } else {
        return Left(
            ServerFailure.BadfromResponse(response.statusCode!, response.data));
      }
    } catch (e,s) {
      print(s);
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else if (e is NetworkFailure) {
        return Left(NetworkFailure(e.errorMessage));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
