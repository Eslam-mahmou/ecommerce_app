import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:flutter/material.dart';

import '../../../widget/sign_in_view_body.dart';

class SignInScreenView extends StatelessWidget {
  const SignInScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      body:SignInViewBody()
    );
  }
}
