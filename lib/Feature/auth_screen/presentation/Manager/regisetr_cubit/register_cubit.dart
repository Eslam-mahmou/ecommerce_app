import 'package:ecommerce_app/Feature/auth_screen/domain/use_case/auth_use_case.dart';
import 'package:ecommerce_app/Feature/auth_screen/presentation/Manager/regisetr_cubit/register_state.dart';
import 'package:ecommerce_app/core/Services/shared_preference_services.dart';
import 'package:ecommerce_app/core/Utils/constant_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authUseCase) : super(InitialRegisterState());

  static get(context) => BlocProvider.of(context);
  AuthUseCase authUseCase;
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
 static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscureText=false;
  bool obscurePassword=false;
  void register() async {
    emit(LoadingRegisterState());
    var either = await authUseCase.executeRegister(
        nameController.text,
        passwordController.text,
        emailController.text,
        confirmPasswordController.text,
        phoneController.text);
    either.fold(
      (error) {
        emit(ErrorRegisterState( error.errorMessage));
      },
      (response) {
        emit(SuccessRegisterState(registerResponseEntity: response));
        confirmPasswordController.clear();
        phoneController.clear();
        nameController.clear();
        emailController.clear();
        passwordController.clear();
      },
    );
  }
  void clearData(){
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    confirmPasswordController.clear();
    phoneController.clear();

  }
  void isObscure() {
    emit(IsObscuredConfirmPasswordState());
    obscureText=!obscureText;
  }
  bool isObscuredPassword() {
    emit(IsObscuredPasswordState());
    return obscurePassword=!obscurePassword;
  }

}
