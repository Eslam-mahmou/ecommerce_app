import 'package:ecommerce_app/core/Utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSlideAnimation extends StatelessWidget {
  const CustomSlideAnimation({super.key, required this.slideAnimation});

  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slideAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slideAnimation,
            child: Padding(
              padding:  EdgeInsets.only(left: 96.w,
              right: 96.w,top: 200.h),
              child: Image.asset(ImageAssets.logoBuy),
            ),
          );
        });
  }
}
