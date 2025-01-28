import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../core/Utils/style_manager.dart';

class CustomBottomNavigationItem extends BottomNavigationBarItem{
  String title;
  String iconPath;
  CustomBottomNavigationItem(this.iconPath,this.title):
  super(
        icon: ImageIcon(AssetImage(iconPath),
        color: ColorsManager.whiteColor,
        size: 28,),
        label: title,
        activeIcon: CircleAvatar(
          backgroundColor: ColorsManager.whiteColor,
          radius: 15,
          child:ImageIcon(
            AssetImage(iconPath),
            color: ColorsManager.primaryColor,
            size: 32,
          ),
        )

      );

}