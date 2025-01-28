import 'package:ecommerce_app/Feature/auth_screen/presentation/Pages/sign_up/view/sign_up_view.dart';
import 'package:ecommerce_app/Feature/cart_screen/presentation/view/cart_screen.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/category_tab/presentation/pages/product_screen_details.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/layout/layout_view.dart';
import 'package:ecommerce_app/core/routes_manager/page_routes.dart';
import 'package:flutter/material.dart';
import '../../Feature/auth_screen/presentation/Pages/sign_in/view/sign_in_screen.dart';
import '../../Feature/layout_screen/presentation/search_screen/presentation/view/searchScreen.dart';
import '../../Feature/splash_screen/presentation/view/splash_screen_view.dart';

class RoutesGenerate {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.splashScreen:
        return MaterialPageRoute(
            builder: (_) => const SplashScreenView(), settings: settings);
      case PagesRoutes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => const SignInScreenView(), settings: settings);
      case PagesRoutes.signUpScreen:
        return MaterialPageRoute(
            builder: (_) => const SignUpView(), settings: settings);
      case PagesRoutes.layoutScreen:
        return MaterialPageRoute(
            builder: (_) => const LayoutView(), settings: settings);
      case PagesRoutes.productDetailScreen:
        return MaterialPageRoute(
            builder: (_) => const ProductScreenDetails(), settings: settings);
      case PagesRoutes.cartScreen:
        return MaterialPageRoute(
            builder: (_) => const CartScreen(), settings: settings);
      case PagesRoutes.searchPage :
        return MaterialPageRoute(builder: (_) => const SearchScreen(),);
      default:
        return unDefinedRoute();
    }
  }
}

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Un defined route"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("Un defined route"),
        ),
      );
    },
  );
}
