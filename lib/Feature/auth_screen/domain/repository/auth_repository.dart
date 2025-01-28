import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Feature/auth_screen/domain/entities/login_response_entities.dart';
import 'package:ecommerce_app/Feature/auth_screen/domain/entities/register_response_entities.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';

abstract class AuthRepository {
  Future<Either<DioFailure, RegisterResponseEntity>> signUp(
      String name,
      String password,
      String email,
      String rePassword,
      String phone);
 Future<Either<DioFailure,LoginResponseEntity>> signIn(String email,String password);
}
