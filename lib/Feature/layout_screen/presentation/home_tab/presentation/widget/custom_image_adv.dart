import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/home_tab_cubit/home_tab_cubit.dart';
import 'package:ecommerce_app/core/Widget/custom_image_slide_show.dart';
import 'package:flutter/material.dart';

class CustomImageAdv extends StatelessWidget {
  const CustomImageAdv({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomImageSlideShow(
        child: HomeTabCubit.images
            .map((image) => Image.asset(
                  image,
                  fit: BoxFit.fill,
                ))
            .toList());
  }
}
