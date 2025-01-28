import 'package:ecommerce_app/Feature/auth_screen/presentation/Manager/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/Feature/auth_screen/presentation/Manager/regisetr_cubit/register_cubit.dart';
import 'package:ecommerce_app/core/Services/servier_locator.dart';
import 'package:ecommerce_app/core/Services/shared_preference_services.dart';
import 'package:ecommerce_app/core/Utils/assets_manager.dart';
import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:ecommerce_app/core/Utils/constant_manager.dart';
import 'package:ecommerce_app/core/Utils/font_manager.dart';
import 'package:ecommerce_app/core/Utils/style_manager.dart';
import 'package:ecommerce_app/core/Widget/CustomAuthButton.dart';
import 'package:ecommerce_app/core/Widget/CustomTextFormField.dart';
import 'package:ecommerce_app/core/Widget/custom_validate.dart';
import 'package:ecommerce_app/core/routes_manager/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Widget/custom_diaolg.dart';
import '../Manager/login_cubit/login_state.dart';

class SignInViewBody extends StatelessWidget {
  SignInViewBody({super.key});

  LoginCubit viewModel = getIt<LoginCubit>();
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoadingLoginState) {
        DialogUtils.showLoading(context: context, message: "Loading...");
      }
      if (state is SuccessLoginState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
            context: context,
            message: "Login successfully",
            title: "Success",
            postActionName: "Ok",
            negativeActionName: "Cancel",
            postAction: () {
              SharedPreferenceServices.getToken(AppConstants.token);
              Navigator.pushNamed(context, PagesRoutes.layoutScreen);
            });
      }
      if (state is ErrorLoginState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
          context: context,
          message: state.errorMessage,
          title: "error",
          postActionName: "Ok",
        );
      }
    }, builder: (context, state) {
      return Form(
        key: fromKey,
        child: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: 96.w, right: 96.w, top: 91.h, bottom: 86.h),
                          child: Image.asset(ImageAssets.logoBuy)),
                      Text(
                        AppConstants.welcomeBack,
                        style: getTextStyle(
                            FontSize.s24,
                            FontWeightManager.semiBold,
                            ColorsManager.primaryColor),
                      ),
                      Text(
                        AppConstants.pleaseSignInWithYourMail,
                        style: getTextStyle(
                            FontSize.s18,
                            FontWeightManager.light,
                            ColorsManager.primaryColor),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Text(
                        AppConstants.email,
                        style: getTextStyle(
                            FontSize.s18,
                            FontWeightManager.medium,
                            ColorsManager.primaryColor),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      CustomTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: viewModel.emailController,
                          validate: AppValidate.validateEmail,
                          text: AppConstants.enterYourMail),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        AppConstants.password,
                        style: getTextStyle(
                            FontSize.s18,
                            FontWeightManager.medium,
                            ColorsManager.primaryColor),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      CustomTextFormField(
                          keyboardType: TextInputType.text,
                          text: AppConstants.enterYourPassword,
                          controller: viewModel.passwordController,
                          validate: AppValidate.validatePassword,
                          obscureText: viewModel.obscurePassword,
                          suffixIcon: IconButton(
                              onPressed: () {
                                viewModel.obscurePassword =
                                    viewModel.isObscuredLoginPassword();
                              },
                              icon: viewModel.obscurePassword
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                AppConstants.forgetPassword,
                                textAlign: TextAlign.end,
                                style: getTextStyle(
                                    FontSize.s18,
                                    FontWeightManager.regular,
                                    ColorsManager.primaryColor),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 56.h,
                      ),
                      CustomButton(
                          onPressed: () {
                            if (fromKey.currentState!.validate()) {
                              viewModel.login();
                            }
                          },
                          child:Text(AppConstants.login,
                              style: getTextStyle(FontSize.s20, FontWeightManager.semiBold,
                                  ColorsManager.primaryColor))),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppConstants.doNotHaveAccount,
                            style: getTextStyle(
                                FontSize.s18,
                                FontWeightManager.medium,
                                ColorsManager.primaryColor),
                          ),
                          InkWell(
                            onTap: () {
                              viewModel.emailController.clear();
                              viewModel.passwordController.clear();
                              Navigator.pushNamed(
                                  context, PagesRoutes.signUpScreen);
                            },
                            child: Text(
                              AppConstants.createAccount,
                              style: getTextStyle(
                                  FontSize.s18,
                                  FontWeightManager.medium,
                                  ColorsManager.primaryColor),
                            ),
                          )
                        ],
                      ),
                    ])))),
      );
    });
  }
}
