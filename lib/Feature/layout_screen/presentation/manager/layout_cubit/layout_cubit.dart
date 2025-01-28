import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../category_tab/presentation/pages/category_screen.dart';
import '../../favorite_tab/presentation/view/favorite_tab_view.dart';
import '../../home_tab/presentation/view/home_tab_view.dart';
import '../../profile_tab/presentation/view/profile_tab_view.dart';
import 'layout_state.dart';

class MainCubit extends Cubit <MainPageState>{
  MainCubit():super(InitialMainPageState());
  int currentIndex=0;
  List<Widget> tabs=[
const HomeTabView(),
const CategoryTabView(),
const FavoriteTabView(),
const ProfileTabView()
  ];
  void changeIndex(int selectedIndex){
    emit(InitialMainPageState());
    currentIndex=selectedIndex;
    emit(ChangeIndexState());
  }

}