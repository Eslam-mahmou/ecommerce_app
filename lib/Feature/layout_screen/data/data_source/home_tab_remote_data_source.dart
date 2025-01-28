import 'package:dio/dio.dart';


abstract class HomeTabRemoteDataSource{
  Future<Response> getAllCategories();
  Future<Response> getAllBrands();
}