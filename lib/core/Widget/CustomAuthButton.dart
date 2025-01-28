import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key,required this.onPressed,required this.child});
  VoidCallback onPressed;
 final Widget child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            side:
                const BorderSide(color: ColorsManager.primaryColor, width: 1.2),
            fixedSize: Size(MediaQuery.of(context).size.width, 60.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0),
        onPressed: onPressed,
        child: child
        );
  }
}
