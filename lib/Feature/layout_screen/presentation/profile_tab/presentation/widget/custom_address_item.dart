import 'package:ecommerce_app/Feature/layout_screen/domain/entities/add_address_response_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/profile_tab_cubit/profile_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/Utils/colors_manager.dart';
import '../../../../../../core/Utils/font_manager.dart';
import '../../../../../../core/Utils/style_manager.dart';

class CustomAddressItem extends StatelessWidget {
  CustomAddressItem({super.key, required this.address});

  AddAddressDataEntity address;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorsManager.whiteColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ColorsManager.primaryColor)),
      child: Stack(alignment: Alignment.topRight, children: [
        Column(
          children: [
            Row(
              children: [
                Text(
                  "Name:- ",
                  style: getTextStyle(FontSize.s18, FontWeight.normal,
                      ColorsManager.blackColor),
                ),
                Text("${address.name}",
                    style: getTextStyle(FontSize.s18, FontWeight.normal,
                        ColorsManager.blackColor))
              ],
            ),
            Row(
              children: [
                Text(
                  "Address:- ",
                  style: getTextStyle(FontSize.s18, FontWeight.normal,
                      ColorsManager.blackColor),
                ),
                Text("${address.details}",
                    style: getTextStyle(FontSize.s18, FontWeight.normal,
                        ColorsManager.blackColor))
              ],
            ),
            Row(
              children: [
                Text(
                  "Phone:- ",
                  style: getTextStyle(FontSize.s18, FontWeight.normal,
                      ColorsManager.blackColor),
                ),
                Text("${address.phone}",
                    style: getTextStyle(FontSize.s18, FontWeight.normal,
                        ColorsManager.blackColor))
              ],
            ),
          ],
        ),
        IconButton(
            onPressed: () {
              if( ProfileTabCubit.get(context).address.isNotEmpty){
              BlocProvider.of<ProfileTabCubit>(context)
                  .removeSpecificAddress(address.id.toString());}
            },
            icon: const Icon(
              Icons.delete,
              size: 30,
            ))
      ]),
    );
  }
}
