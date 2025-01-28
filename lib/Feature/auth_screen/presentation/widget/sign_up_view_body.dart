import 'package:ecommerce_app/Feature/auth_screen/presentation/Manager/regisetr_cubit/register_state.dart';
import 'package:ecommerce_app/core/Utils/assets_manager.dart';
import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:ecommerce_app/core/Utils/constant_manager.dart';
import 'package:ecommerce_app/core/Utils/font_manager.dart';
import 'package:ecommerce_app/core/Utils/style_manager.dart';
import 'package:ecommerce_app/core/Widget/CustomAuthButton.dart';
import 'package:ecommerce_app/core/Widget/CustomTextFormField.dart';
import 'package:ecommerce_app/core/Widget/custom_diaolg.dart';
import 'package:ecommerce_app/core/Widget/custom_validate.dart';
import 'package:ecommerce_app/core/routes_manager/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/Services/servier_locator.dart';
import '../Manager/regisetr_cubit/register_cubit.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});

  RegisterCubit registerCubit = getIt<RegisterCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      if (state is LoadingRegisterState) {
        DialogUtils.showLoading(context: context, message: "Loading...");
      }
      if (state is SuccessRegisterState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
          context: context,
          message: "Registration successfully",
          title: "Success",
          postActionName: "Ok",
          negativeActionName: "Cancel",
          postAction: () =>
              Navigator.pushNamed(context, PagesRoutes.layoutScreen),
        );
      }
      if (state is ErrorRegisterState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
            context: context,
            message: state.errorMessage,
            title: "error",
            postActionName: "Ok");
      }
    }, builder: (context, state) {
      return Form(
        key: RegisterCubit.formKey,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            left: 96.w, right: 96.w, top: 40.h, bottom: 46.h),
                        child: Image.asset(ImageAssets.logoBuy)),
                    Text(
                      AppConstants.fullName,
                      style: getTextStyle(FontSize.s18,
                          FontWeightManager.medium, ColorsManager.primaryColor),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.name,
                        controller: registerCubit.nameController,
                        validate: AppValidate.validateFullName,
                        text: AppConstants.enterYourFullName),
                    SizedBox(
                      height: 28.h,
                    ),
                    Text(
                      AppConstants.phoneNumber,
                      style: getTextStyle(FontSize.s18,
                          FontWeightManager.medium, ColorsManager.primaryColor),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.phone,
                        controller: registerCubit.phoneController,
                        validate: AppValidate.validateMobile,
                        text: AppConstants.enterYourPhoneNumber),
                    SizedBox(
                      height: 28.h,
                    ),
                    Text(
                      AppConstants.email,
                      style: getTextStyle(FontSize.s18,
                          FontWeightManager.medium, ColorsManager.primaryColor),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: registerCubit.emailController,
                        validate: AppValidate.validateEmail,
                        text: AppConstants.enterYourMail),
                    SizedBox(
                      height: 28.h,
                    ),
                    Text(
                      AppConstants.password,
                      style: getTextStyle(FontSize.s18,
                          FontWeightManager.medium, ColorsManager.primaryColor),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.text,
                      controller: registerCubit.passwordController,
                      validate: AppValidate.validatePassword,
                      text: AppConstants.enterYourPassword,
                      suffixIcon: IconButton(
                          onPressed: () {
                            registerCubit.obscurePassword =
                                registerCubit.isObscuredPassword();
                          },
                          icon: registerCubit.obscurePassword
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    Text(
                      AppConstants.confirmPassword,
                      style: getTextStyle(FontSize.s18,
                          FontWeightManager.medium, ColorsManager.primaryColor),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.text,
                      controller: registerCubit.confirmPasswordController,
                      validate: AppValidate.validateConfirmPassword,
                      text: AppConstants.enterYourPassword,
                      obscureText: registerCubit.obscureText,
                      suffixIcon: IconButton(
                          onPressed: () {
                            registerCubit.obscureText =
                                registerCubit.isObscure() as bool;
                          },
                          icon: registerCubit.obscureText
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomButton(
                        onPressed: () {
                          if (RegisterCubit.formKey.currentState!.validate()) {
                            registerCubit.register();
                          }
                        },
                        child:Text(AppConstants.signUp, style: getTextStyle(FontSize.s20, FontWeightManager.semiBold,
                            ColorsManager.primaryColor))),
                    SizedBox(
                      height: 20.h,
                    )
                  ]),
            ),
          ),
        ),
      );
    });
  }
}
