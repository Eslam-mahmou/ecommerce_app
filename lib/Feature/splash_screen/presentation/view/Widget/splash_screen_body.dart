import 'package:ecommerce_app/core/Utils/constant_manager.dart';
import 'package:ecommerce_app/core/routes_manager/page_routes.dart';
import 'package:flutter/material.dart';
import '../../../../../core/Services/shared_preference_services.dart';
import 'custom_slide_animation.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}
late AnimationController animationController;
late Animation<Offset> slideAnimation;

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  void initState() {
    super.initState();
    getSlideAnimation();
    navigation();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSlideAnimation(
      slideAnimation: slideAnimation,
    );
  }

  void navigation() {
    Future.delayed(const Duration(milliseconds: 1800), () {
      var token = SharedPreferenceServices.getToken(AppConstants.token);
      if (token == null) {
        Navigator.pushReplacementNamed(context, PagesRoutes.loginScreen);
      } else {
        Navigator.pushReplacementNamed(context, PagesRoutes.layoutScreen);
      }

    });
  }
  void getSlideAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds:1000));
    slideAnimation = Tween<Offset>(begin: const Offset(0, 20), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
  }
}
