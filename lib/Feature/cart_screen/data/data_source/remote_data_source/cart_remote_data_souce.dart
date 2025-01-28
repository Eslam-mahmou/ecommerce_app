

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/Services/api_manager.dart';
import 'package:ecommerce_app/core/Services/shared_preference_services.dart';
import 'package:ecommerce_app/core/Utils/constant_manager.dart';
import 'package:ecommerce_app/core/Utils/end_point.dart';

abstract class CartBaseRemoteDataSource {
  Future<Response> getCart();
  Future<Response> updateCart(String productId,num count);
  Future<Response> deleteCart(String productId);
}

class CartRemoteDataSourceImpl implements CartBaseRemoteDataSource {
  ApiManager apiManager;

  CartRemoteDataSourceImpl(this.apiManager);
  // var token = SharedPreferenceServices.getToken(AppConstants.token);
  @override
  Future<Response> getCart() async {
    log(SharedPreferenceServices.getToken(AppConstants.token.toString()).toString());
    return await apiManager
        .getData(EndPoints.addCart, headers: {"token": SharedPreferenceServices.getToken(AppConstants.token.toString())});
  }

  @override
  Future<Response> updateCart(String productId,num count) async{
     return await apiManager.putData("${EndPoints.addCart}/$productId",
         {
           "count":count
         }, {
       "token":SharedPreferenceServices.getToken(AppConstants.token.toString())
         });
  }

  @override
  Future<Response> deleteCart(String productId)async {
    return await apiManager.deleteData("${EndPoints.addCart}/$productId",
    headers: {
      "token":SharedPreferenceServices.getToken(AppConstants.token.toString())
    });
  }
}
