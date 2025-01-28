import 'package:ecommerce_app/Feature/layout_screen/domain/entities/get_wishlist_response_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/Favorite_tab_cubit/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/wishlist_use_case.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(this.wishlistUseCase) : super(InitialWishlistState());
  GetWishlistUseCase wishlistUseCase;
  List<GetDataWishlistEntity> wishlist = [];

  static WishlistCubit get(context) => BlocProvider.of(context);

  Future<void> fetchWishlist() async {
    emit(LoadingWishlistState());
    var data = await wishlistUseCase.call();
    data.fold(
      (error) {
        emit(FailureWishlistState(error.errorMessage));
      },
      (response) {
        wishlist = response.data??[];
        emit(SuccessWishlistState(response.data??[]));
      },
    );
  }
  Future<void> deleteWishlist(String productId) async {
    emit(LoadingDeleteWishlistState());
    var data =await wishlistUseCase.deleteWishlist(productId);
    data.fold((error) {
      emit(FailureDeleteWishlistState(error.errorMessage));
    }, (response) {
      emit(SuccessDeleteWishlistState());
      fetchWishlist();
    },);
  }
}
