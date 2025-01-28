import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class ConfigLoading {
  void showLoading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..maskType = EasyLoadingMaskType.black
      ..textColor=ColorsManager.whiteColor
      ..indicatorColor = ColorsManager.primaryColor
      ..userInteractions = false
      ..dismissOnTap = true
      ..backgroundColor=ColorsManager.whiteColor;
  }
}