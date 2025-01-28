

import '../../../domain/entities/login_response_entities.dart';

abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {
  LoginResponseEntity loginResponseEntity;

  SuccessLoginState({required this.loginResponseEntity});
}

class ErrorLoginState extends LoginState {
  final String errorMessage;

  ErrorLoginState( this.errorMessage);
}
class IsObscuredPasswordState extends LoginState {}