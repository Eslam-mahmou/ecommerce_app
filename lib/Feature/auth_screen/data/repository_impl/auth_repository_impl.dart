import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Feature/auth_screen/data/data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app/Feature/auth_screen/domain/entities/login_response_entities.dart';

import 'package:ecommerce_app/Feature/auth_screen/domain/entities/register_response_entities.dart';

import 'package:ecommerce_app/core/Errors/dio_error.dart';

import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<DioFailure, RegisterResponseEntity>> signUp(String name,
      String password, String email, String rePassword, String phone) async {
    var either = await authRemoteDataSource.signUp(
        name, password, email, rePassword, phone);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<DioFailure, LoginResponseEntity>> signIn(String email,
      String password) async {
    var either = await authRemoteDataSource.signIn(email, password);
    return either.fold((error) => Left(error), (response) => Right(response),
        );
  }
}
