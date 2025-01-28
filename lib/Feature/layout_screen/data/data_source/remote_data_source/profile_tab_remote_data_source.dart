import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/Services/api_manager.dart';
import 'package:ecommerce_app/core/Services/shared_preference_services.dart';
import 'package:ecommerce_app/core/Utils/constant_manager.dart';
import 'package:ecommerce_app/core/Utils/end_point.dart';

abstract class ProfileTabRemoteDataSource {
  Future<Response> addAddress(
      String home, String homeDetails, String phone, String city);
  Future<Response> getAddress();
  Future<Response> removeAddress(String addressId);
}

class ProfileTabRemoteDataSourceImpl implements ProfileTabRemoteDataSource {
  ProfileTabRemoteDataSourceImpl(this.apiManager);

  ApiManager apiManager;

  @override
  Future<Response> addAddress(
      String home, String homeDetails, String phone, String city) async {
    return await apiManager.postData(EndPoints.addAddress, headers: {
      "token": SharedPreferenceServices.getToken(AppConstants.token).toString()
    }, body: {
      "name": home,
      "details": homeDetails,
      "phone": phone,
      "city": city
    });
  }

  @override
  Future<Response> getAddress()async {
    return await apiManager.getData(EndPoints.addAddress,
    headers:{
      "token":SharedPreferenceServices.getToken("token").toString()
    });
  }

  @override
  Future<Response> removeAddress(String addressId) async{
    return await apiManager.deleteData("${EndPoints.addAddress}/$addressId",
    headers: {
      "token":SharedPreferenceServices.getToken("token").toString()
    });
  }
}
