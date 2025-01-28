import 'dart:developer';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/add_address_response_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/use_case/profile_tab_use_case.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/profile_tab_cubit/profile_tab_state.dart';
import 'package:ecommerce_app/core/Services/shared_preference_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileTabCubit extends Cubit<ProfileTabState> {
  ProfileTabCubit(this.profileTabUseCase) : super(InitialProfileTabState());
  ProfileTabUseCase profileTabUseCase;

  var home = TextEditingController();
  var name = TextEditingController();
  var phone = TextEditingController();
  var city = TextEditingController();
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? image;

  final ImagePicker picker = ImagePicker();
  List<AddAddressDataEntity> address = [];

  static ProfileTabCubit get(context) => BlocProvider.of(context);

  Future<void> loadImagePath() async {
    emit(InitialProfileTabState());
    SharedPreferenceServices.getToken("image");
    emit(SuccessProfileTabState());
  }

  Future<void> pickImageFromCamera() async {
    emit(InitialProfileTabState());
    try {
      final imageCamera = await picker.pickImage(source: ImageSource.camera);
      if (imageCamera != null) {
        image = imageCamera.path;
        await SharedPreferenceServices.saveToken("image", image);
        await loadImagePath();
        log(image!);
        emit(SuccessProfileTabState());
      } else {
        emit(FailureProfileTabState("No image selected"));
      }
    } catch (s, e) {
      emit(FailureProfileTabState(e.toString()));
    }
  }

  Future<void> pickImageFromGallery() async {
    emit(InitialProfileTabState());
    try {
      final imageCamera = await picker.pickImage(source: ImageSource.gallery);
      if (imageCamera != null) {
        image = imageCamera.path;
        await SharedPreferenceServices.saveToken("image", image);
        await loadImagePath();
        emit(SuccessProfileTabState());
      } else {
        emit(FailureProfileTabState("No image selected"));
      }
    } catch (e) {
      emit(FailureProfileTabState(e.toString()));
    }
  }

  Future<void> addAddress() async {
    emit(LoadingAddressState());
    var info = await profileTabUseCase.callAddAddress(
        name.text, home.text, phone.text, city.text);
    info.fold(
      (error) {
        emit(FailureAddressState(error.errorMessage));
      },
      (response)  {
        emit(SuccessAddressState(response));
        home.clear();
        name.clear();
        phone.clear();
        city.clear();
        fetchSpecificAddress();
      },
    );
  }

  Future<void> fetchSpecificAddress() async {
    emit(LoadingGetAddressState());
    var addressInfo = await profileTabUseCase.executeGetAddress();
    addressInfo.fold(
      (error) {
        emit(FailureGetAddressState(error.errorMessage));
      },
      (response) {
        address = response.data!;
        emit(SuccessGetAddressState(response));
      },
    );
  }

  Future<void> removeSpecificAddress(String addressId) async {
    emit(LoadingRemoveAddressState());
    var data = await profileTabUseCase.callRemoveAddress(addressId);
    data.fold(
      (error) {
        emit(FailureRemoveAddressState(error.errorMessage));
      },
      (response) {
        emit(SuccessRemoveAddressState(response));
        fetchSpecificAddress();
      },
    );
  }
}
