import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/data_source/remote_data_source/categories_tab_remote_data_source.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/model/sub_category_model.dart';

import 'package:ecommerce_app/Feature/layout_screen/domain/entities/sub_category_entity.dart';

import 'package:ecommerce_app/core/Errors/dio_error.dart';

import '../../domain/repository/categories_tab_repository.dart';

class CategoriesTabRepositoryImpl implements CategoriesTabRepository {
  SubCategoryBaseDateSource subCategoryBaseDateSource;

  CategoriesTabRepositoryImpl(this.subCategoryBaseDateSource);

  @override
  Future<Either<DioFailure, List<SubCategoryEntity>>> getAllSubCategories(
      String categoryId) async {
    var response =
        await subCategoryBaseDateSource.getAllSubCategories(categoryId);
    log("cwedkf $categoryId");
    List<SubCategoryEntity> subCategories = [];
    print(response);
    try {
      if (response.statusCode == 200) {
        var data = response.data["data"];
        for (var element in data) {
          subCategories.add(SubCategoryModel.fromJson(element));
        }
        return Right(subCategories);
      } else {
        return Left(
            ServerFailure.BadfromResponse(response.statusCode!, response.data));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else if (e is NetworkFailure) {
        return Left(NetworkFailure(e.message));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
