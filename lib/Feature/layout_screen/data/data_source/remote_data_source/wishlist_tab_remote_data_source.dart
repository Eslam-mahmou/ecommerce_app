import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/Services/api_manager.dart';
import 'package:ecommerce_app/core/Utils/end_point.dart';

import '../../../../../core/Services/shared_preference_services.dart';
import '../../../../../core/Utils/constant_manager.dart';

abstract class WishlistTabRemoteDataSource {
  Future<Response> getWishlist();
  Future<Response> deleteWishlist(String productId);
}
class WishlistTabRemoteDataSourceImpl implements WishlistTabRemoteDataSource {
  ApiManager apiManager;
  WishlistTabRemoteDataSourceImpl(this.apiManager);

  @override
  Future<Response> getWishlist() async{
    log(SharedPreferenceServices.getToken(AppConstants.token.toString()).toString());
    return await apiManager.getData(EndPoints.wishlist,
    headers: {
      "token":SharedPreferenceServices.getToken(AppConstants.token.toString())
    });
  }

  @override
  Future<Response> deleteWishlist(String productId) async{
    return await apiManager.deleteData("${EndPoints.wishlist}/$productId",
    headers: {
      "token":SharedPreferenceServices.getToken(AppConstants.token.toString())
    });
  }

}