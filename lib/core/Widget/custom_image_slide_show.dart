import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/colors_manager.dart';

class CustomImageSlideShow extends StatelessWidget {
  CustomImageSlideShow({super.key, required this.child,this.height=200});

  List<Widget> child;
 double height;

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
        height: height..h,
        width: double.infinity,
        indicatorColor: ColorsManager.primaryColor,
        isLoop: true,
        indicatorBackgroundColor:Colors.grey,
        disableUserScrolling: true,
        indicatorBottomPadding: 16.h,
        initialPage: 0,
        autoPlayInterval: 3000,
        children: child);
  }
}
