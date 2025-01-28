import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Feature/auth_screen/domain/entities/login_response_entities.dart';
import 'package:ecommerce_app/Feature/auth_screen/domain/entities/register_response_entities.dart';
import 'package:ecommerce_app/Feature/auth_screen/domain/repository/auth_repository.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';

class AuthUseCase {
  AuthRepository authRepository;

  AuthUseCase(this.authRepository);

  Future<Either<DioFailure, RegisterResponseEntity>> executeRegister(
      String name,
      String password,
      String email,
      String rePassword,
      String phone) {
    return authRepository.signUp(name, password, email, rePassword, phone);
  }

  Future<Either<DioFailure, LoginResponseEntity>> executeLogin(
       String email, String password) {
   return authRepository.signIn(email, password);
  }
}
