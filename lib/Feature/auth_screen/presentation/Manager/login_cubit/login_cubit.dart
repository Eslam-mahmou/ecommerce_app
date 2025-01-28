import 'package:ecommerce_app/Feature/auth_screen/domain/use_case/auth_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authUseCase) : super(InitialLoginState());

  static get(context) => BlocProvider.of(context);
  AuthUseCase authUseCase;
  var passwordController = TextEditingController(text:"ASDasd@123");
  var emailController = TextEditingController(text: "solom6112002@gmail.com");
   GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();
  bool obscurePassword = false;

  void login() async {
    emit(LoadingLoginState());
    var either = await authUseCase.executeLogin(
    emailController.text, passwordController.text,

    );
    either.fold(
      (error) {
        emit(ErrorLoginState(error.errorMessage));
      },
      (response) async{
        emit(SuccessLoginState(loginResponseEntity: response));
        emailController.clear();
        passwordController.clear();
      },
    );
  }

  bool isObscuredLoginPassword() {
    emit(IsObscuredPasswordState());
    return obscurePassword = !obscurePassword;
  }
}
