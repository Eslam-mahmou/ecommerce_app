import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/Services/api_manager.dart';

abstract class SubCategoryBaseDateSource {
  Future<Response> getAllSubCategories(String categoryId);
}

class CategoryTabRemoteDataSourceImpl implements SubCategoryBaseDateSource{
  ApiManager apiManager;
  CategoryTabRemoteDataSourceImpl(this.apiManager);
  @override
  Future<Response> getAllSubCategories(String categoryId)async {
    var response = await apiManager.getData("/api/v1/categories/$categoryId/subcategories");
    return response;
  }
  
}