import 'package:dio/src/response.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/data_source/home_tab_remote_data_source.dart';
import 'package:ecommerce_app/core/Services/api_manager.dart';
import 'package:ecommerce_app/core/Utils/end_point.dart';

class HomeTabRemoteDataSourceImp implements HomeTabRemoteDataSource{
  ApiManager apiManager;
  HomeTabRemoteDataSourceImp(this.apiManager);
  @override
  Future<Response> getAllCategories() async{
 var response=await apiManager.getData(EndPoints.allCategories);
 return response;
  }

  @override
  Future<Response> getAllBrands() async{
   var response=await apiManager.getData(EndPoints.allBrands);
   return response;
  }

  
}