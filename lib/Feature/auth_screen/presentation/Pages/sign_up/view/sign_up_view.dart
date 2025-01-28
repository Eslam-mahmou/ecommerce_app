import 'package:ecommerce_app/Feature/auth_screen/presentation/Manager/regisetr_cubit/register_cubit.dart';
import 'package:ecommerce_app/core/Services/servier_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/Utils/colors_manager.dart';
import '../../../widget/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = getIt<RegisterCubit>();
    return Scaffold(
        backgroundColor: ColorsManager.whiteColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 35.h,
          leading: IconButton(
            onPressed: () {
             viewModel.clearData();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          iconTheme: const IconThemeData(color: ColorsManager.primaryColor),
        ),
        body: SignUpViewBody());
  }
}
