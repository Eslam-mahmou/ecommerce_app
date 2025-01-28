import 'dart:io';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/add_address_response_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/profile_tab_cubit/profile_tab_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/profile_tab_cubit/profile_tab_state.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/profile_tab/presentation/widget/customBottomSheet.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/profile_tab/presentation/widget/custom_address_item.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/profile_tab/presentation/widget/custom_profile_image.dart';
import 'package:ecommerce_app/core/Services/servier_locator.dart';
import 'package:ecommerce_app/core/Services/shared_preference_services.dart';
import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:ecommerce_app/core/Utils/constant_manager.dart';
import 'package:ecommerce_app/core/Utils/font_manager.dart';
import 'package:ecommerce_app/core/Utils/style_manager.dart';
import 'package:ecommerce_app/core/Widget/CustomAuthButton.dart';
import 'package:ecommerce_app/core/Widget/CustomTextFormField.dart';
import 'package:ecommerce_app/core/Widget/custom_diaolg.dart';
import 'package:ecommerce_app/core/routes_manager/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTabView extends StatelessWidget {
  const ProfileTabView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = getIt<ProfileTabCubit>();
    return BlocConsumer<ProfileTabCubit, ProfileTabState>(
      bloc: viewModel..fetchSpecificAddress(),
      listener: (context, state) {
        if (state is FailureProfileTabState) {
          DialogUtils.showMessage(
              context: context, title: "Error", message: state.errMessage);
        }
        if (state is FailureGetAddressState) {
          DialogUtils.showMessage(
              context: context, title: "Error", message: state.errMessage);
        }
        if (state is FailureAddressState) {
          DialogUtils.showMessage(
              context: context, title: "Error", message: state.errMessage);
        }
        if (state is FailureRemoveAddressState) {
          DialogUtils.showMessage(
              context: context, title: "Error", message: state.errMessage);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Welcome, Eslam",
                  style: getTextStyle(FontSize.s18.sp, FontWeightManager.medium,
                      ColorsManager.primaryColor),
                ),
                Text(
                  "solom6112002@gmail.com",
                  style: getTextStyle(
                      FontSize.s14.sp, FontWeightManager.medium, Colors.grey),
                ),
                SizedBox(
                  height: 12.h,
                ),
                const CustomProfileImage(),
                SizedBox(
                  height: 16.h,
                ),
                CustomButton(
                    onPressed: () {
                      showBottomSheet(
                        context: context,
                        builder: (context) {
                          return const CustomBottomSheet();
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.location_city,
                          color: ColorsManager.primaryColor,
                        ),
                        Text(
                          "Address",
                          style: getTextStyle(
                              FontSize.s16.sp,
                              FontWeightManager.regular,
                              ColorsManager.primaryColor),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: ColorsManager.primaryColor,
                        )
                      ],
                    )),
                SizedBox(
                  height: 15.h,
                ),
                state is LoadingGetAddressState ||
                    state is LoadingRemoveAddressState ||
                    state is LoadingAddressState
                    ? const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.primaryColor,
                  ),
                )
                    : state is SuccessGetAddressState &&
                    viewModel.address.isNotEmpty
                    ? CustomAddressItem(
                  address:
                  viewModel.address[viewModel.address.length - 1],
                )
                    :  Container(),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 40.w),
                  child: CustomButton(onPressed: () {
                    SharedPreferenceServices.deleteToken(AppConstants.token);
                    SharedPreferenceServices.deleteToken("item");
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      PagesRoutes.loginScreen,
                          (route) => false,
                    );
                  }, child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Text("Log out",
                      style: getTextStyle(FontSize.s18, FontWeightManager.medium,
                          ColorsManager.primaryColor),),
                    const Icon(
                      Icons.logout,
                      color: ColorsManager.primaryColor,
                    ),
                  ],)),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
