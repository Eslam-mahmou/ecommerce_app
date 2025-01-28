import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:flutter/material.dart';

import 'Widget/splash_screen_body.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      body:SplashScreenBody()
    );
  }
}
