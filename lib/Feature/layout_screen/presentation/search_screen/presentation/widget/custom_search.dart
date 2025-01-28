import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/search_cubit/search_cubit.dart';
import 'package:ecommerce_app/core/Services/servier_locator.dart';
import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/Utils/constant_manager.dart';
import '../../../../../../core/Utils/font_manager.dart';
import '../../../../../../core/Utils/style_manager.dart';
import '../../../manager/product_cubit/product_cubit.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: TextFormField(
        cursorColor: ColorsManager.blackColor,
        onChanged: (value) {
            getIt<SearchCubit>().search(query: value);
        },
        decoration: InputDecoration(
            border: inputBorder(),
            enabledBorder: inputBorder(),
            focusedBorder: inputBorder(),
            prefixIcon: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: ColorsManager.primaryColor,
                  size: 25,
                )),
            hintText: AppConstants.whatDoYouSearch,
            hintStyle: getTextStyle(FontSize.s16, FontWeightManager.light,
                ColorsManager.blackColor)),
      ),
    );
  }

  UnderlineInputBorder inputBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: ColorsManager.primaryColor,
        width: 1,
      ),
    );
  }
}
