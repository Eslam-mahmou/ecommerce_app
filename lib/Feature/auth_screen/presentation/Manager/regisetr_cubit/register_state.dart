import 'package:ecommerce_app/Feature/auth_screen/domain/entities/register_response_entities.dart';


abstract class RegisterState {}

class InitialRegisterState extends RegisterState {}

class LoadingRegisterState extends RegisterState {}

class SuccessRegisterState extends RegisterState {
  RegisterResponseEntity registerResponseEntity;

  SuccessRegisterState({required this.registerResponseEntity});
}

class ErrorRegisterState extends RegisterState {
  final String errorMessage;

  ErrorRegisterState( this.errorMessage);
}
class IsObscuredConfirmPasswordState extends RegisterState {
}
class IsObscuredPasswordState extends RegisterState {}