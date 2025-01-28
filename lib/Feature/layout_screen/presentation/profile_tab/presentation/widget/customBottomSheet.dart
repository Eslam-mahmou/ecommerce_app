import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/profile_tab_cubit/profile_tab_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/profile_tab_cubit/profile_tab_state.dart';
import 'package:ecommerce_app/core/Services/servier_locator.dart';
import 'package:ecommerce_app/core/Utils/font_manager.dart';
import 'package:ecommerce_app/core/Utils/style_manager.dart';
import 'package:ecommerce_app/core/Widget/CustomAuthButton.dart';
import 'package:ecommerce_app/core/Widget/custom_validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/Utils/colors_manager.dart';
import '../../../../../../core/Widget/CustomTextFormField.dart';
import '../../../../../../core/Widget/custom_diaolg.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = getIt<ProfileTabCubit>();
    return BlocConsumer<ProfileTabCubit,ProfileTabState>(
      listener: (context, state) {
        if(state is FailureAddressState){
          DialogUtils.showMessage(
            context: context,
            message: state.errMessage,
            postActionName: "Ok",
          );

        }
      },
   builder: (context, state) {
     return Form(
       key: ProfileTabCubit.formKey,
       child: Container(
         padding: EdgeInsets.symmetric(horizontal: 16.w),
         height: 500.h,
         color: ColorsManager.whiteColor,
         child: SingleChildScrollView(
           child: Column(
             children: [
               SizedBox(height: 50.h),
               CustomTextFormField(
                 keyboardType: TextInputType.name,
                 text: "name",
                 controller: viewModel.name,
                 validate: AppValidate.validateFullName,
               ),
               SizedBox(
                 height: 16.h,
               ),
               CustomTextFormField(
                 keyboardType: TextInputType.text,
                 text: "Address in detail",
                 controller: viewModel.home,
                 validate: AppValidate.validateFullName,
               ),
               SizedBox(
                 height: 16.h,
               ),
               CustomTextFormField(
                 keyboardType: TextInputType.phone,
                 text: "phone",
                 controller: viewModel.phone,
                 validate: AppValidate.validateMobile,
               ),
               SizedBox(
                 height: 16.h,
               ),
               CustomTextFormField(
                 keyboardType: TextInputType.text,
                 text: "city",
                 controller: viewModel.city,
                 validate: AppValidate.validateFullName,
               ),
               SizedBox(
                 height: 80.h,
               ),
               CustomButton(
                   onPressed: () {
                     if(ProfileTabCubit.formKey.currentState!.validate()){
                       viewModel.addAddress();
                       Navigator.pop(context);
                     }
                
                   },
                   child: state is LoadingAddressState ?const Center(
                     child: CircularProgressIndicator(color:  ColorsManager.primaryColor,),
                   )  : Text(
                     "Add",
                     style: getTextStyle(FontSize.s18, FontWeightManager.semiBold,
                         ColorsManager.primaryColor),
                   )),
               SizedBox(
                 height: 16.h,
               ),
             ],
           ),
         ),
       ),
     );
   },
    );
  }
}
