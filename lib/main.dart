import 'package:bot_toast/bot_toast.dart';
import 'package:ecommerce_app/Feature/auth_screen/presentation/Manager/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/Feature/auth_screen/presentation/Manager/regisetr_cubit/register_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/categories_cubit/sub_categories_tab_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/home_tab_cubit/home_tab_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/product_cubit/product_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/profile_tab_cubit/profile_tab_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/search_cubit/search_cubit.dart';
import 'package:ecommerce_app/core/Services/servier_locator.dart';
import 'package:ecommerce_app/core/Services/shared_preference_services.dart';
import 'package:ecommerce_app/core/routes_manager/page_routes.dart';
import 'package:ecommerce_app/core/routes_manager/routes_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Feature/splash_screen/presentation/view/splash_screen_view.dart';
import 'core/Services/bloc_observer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.init();
  Bloc.observer = MyBlocObserver();
  await SharedPreferenceServices.init();
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<RegisterCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<LoginCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<HomeTabCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<SubCategoriesCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<ProductCubit>()..fetchAllProducts(),
              ),
              BlocProvider(
                create: (context) =>getIt<ProfileTabCubit>(),
              ),
              BlocProvider(create: (context) => getIt<SearchCubit>(),)
            ],
            child: MaterialApp(
              title: "E-commerce App",

              debugShowCheckedModeBanner: false,
              onGenerateRoute: RoutesGenerate.onGenerateRoute,
              initialRoute: PagesRoutes.splashScreen,
              home: child,
              builder: EasyLoading.init(
                builder: BotToastInit()
              ),
            ));
      },
      child: const SplashScreenView(),
    );
  }
}
