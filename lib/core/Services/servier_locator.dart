import 'package:ecommerce_app/Feature/auth_screen/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';
import 'package:ecommerce_app/Feature/auth_screen/data/repository_impl/auth_repository_impl.dart';
import 'package:ecommerce_app/Feature/auth_screen/domain/use_case/auth_use_case.dart';
import 'package:ecommerce_app/Feature/auth_screen/presentation/Manager/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/Feature/auth_screen/presentation/Manager/regisetr_cubit/register_cubit.dart';
import 'package:ecommerce_app/Feature/cart_screen/data/data_source/remote_data_source/cart_remote_data_souce.dart';
import 'package:ecommerce_app/Feature/cart_screen/data/repository_impl/cart_repository_impl.dart';
import 'package:ecommerce_app/Feature/cart_screen/domain/use_case/cart_use_case.dart';
import 'package:ecommerce_app/Feature/cart_screen/presentation/manager/cart_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/data_source/remote_data_source/home_tab_remote_data_source_imp.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/data_source/remote_data_source/product_remote_data_source.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/data_source/remote_data_source/profile_tab_remote_data_source.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/data_source/remote_data_source/wishlist_tab_remote_data_source.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/repository_impl/categories_tab_repository_impl.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/repository_impl/home_tab_repository_impl.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/repository_impl/product_repositpory_impl.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/repository_impl/profile_tab_repository_impl.dart';
import 'package:ecommerce_app/Feature/layout_screen/data/repository_impl/wishlist_repository_impl.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/repository/search_repository.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/use_case/categores_tab_use_case.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/use_case/home_tab_use_case.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/use_case/product_use_case.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/use_case/profile_tab_use_case.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/use_case/search_item_use_case.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/use_case/wishlist_use_case.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/Favorite_tab_cubit/wishlist_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/categories_cubit/sub_categories_tab_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/home_tab_cubit/home_tab_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/product_cubit/product_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/product_specific_cubit/product_specific_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/profile_tab_cubit/profile_tab_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/search_cubit/search_cubit.dart';
import 'package:ecommerce_app/core/Services/api_manager.dart';
import 'package:get_it/get_it.dart';
import '../../Feature/layout_screen/data/data_source/remote_data_source/categories_tab_remote_data_source.dart';
import '../../Feature/layout_screen/data/repository_impl/search_repository_impl.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void init() {
    getIt.registerLazySingleton(
      () => RegisterCubit(AuthUseCase(AuthRepositoryImpl(
          AuthRemoteDataSourceImpl(apiManager: ApiManager())))),
    );
    getIt.registerLazySingleton(() => LoginCubit(AuthUseCase(AuthRepositoryImpl(
        AuthRemoteDataSourceImpl(apiManager: ApiManager())))));
    getIt.registerLazySingleton(
      () => HomeTabCubit(HomeTabUseCase(
          HomeTabRepositoryImpl(HomeTabRemoteDataSourceImp(ApiManager())))),
    );
    getIt.registerLazySingleton(
      () => SubCategoriesCubit(CategoriesTabUseCase(CategoriesTabRepositoryImpl(
          CategoryTabRemoteDataSourceImpl(ApiManager())))),
    );
    getIt.registerLazySingleton(() => ProductCubit(ProductUseCase(
        ProductRepositoryImpl(ProductRemoteDataSourceImpl(ApiManager())))));
    getIt.registerLazySingleton(() => ProductSpecificCubit(ProductUseCase(
        ProductRepositoryImpl(ProductRemoteDataSourceImpl(ApiManager())))));
    getIt.registerLazySingleton(
      () => CartCubit(CartUseCase(
          CartRepositoryImpl(CartRemoteDataSourceImpl(ApiManager())))),
    );
    getIt.registerLazySingleton(
      () => WishlistCubit(GetWishlistUseCase(WishlistRepositoryImpl(
          WishlistTabRemoteDataSourceImpl(ApiManager())))),
    );
    getIt.registerLazySingleton(() => ProfileTabCubit(
          ProfileTabUseCase(ProfileTabRepositoryImpl(
              ProfileTabRemoteDataSourceImpl(ApiManager()))),
        ));
    getIt.registerLazySingleton(
      () => SearchCubit(SearchItemUseCase(SearchRepositoryImpl())),
    );
  }
}
