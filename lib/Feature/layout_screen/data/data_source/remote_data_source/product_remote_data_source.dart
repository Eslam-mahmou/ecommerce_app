import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/Services/api_manager.dart';
import 'package:ecommerce_app/core/Utils/end_point.dart';

import '../../../../../core/Services/shared_preference_services.dart';
import '../../../../../core/Utils/constant_manager.dart';

abstract class BaseProductRemoteDataSource {
  Future<Response> getAllProducts({String? q});

  Future<Response> getSpecificProduct(String productId);

  Future<Response> addCart(String productId);

  Future<Response> addWishlist(String productId);
}

class ProductRemoteDataSourceImpl implements BaseProductRemoteDataSource {
  ProductRemoteDataSourceImpl(this.apiManager);

  ApiManager apiManager;

  @override
  Future<Response> getAllProducts({String? q}) async {
    return await apiManager.getData(EndPoints.allProducts,
    headers: {
      if(q !=null) "q":q,
    });
  }

  @override
  Future<Response> getSpecificProduct(String productId) async {
    return await apiManager.getData("/api/v1/products/$productId");
  }
  @override
  Future<Response> addCart(String productId) async {
    return await apiManager.postData(EndPoints.addCart, headers: {
      "token": SharedPreferenceServices.getToken(AppConstants.token.toString())
    }, body: {
      "productId": productId.toString()
    });
  }

  @override
  Future<Response> addWishlist(String productId) async {
    return await apiManager.postData(EndPoints.wishlist, body: {
      "productId": productId
    }, headers: {
      "token": SharedPreferenceServices.getToken(AppConstants.token.toString())
    });
  }
}
