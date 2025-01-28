import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/add_address_response_entity.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';

abstract class ProfileTabRepository {
  Future<Either<DioFailure, AddAddressResponseEntity>> addAddress(
      String home, String homeDetails, String phone, String city);

  Future<Either<DioFailure, AddAddressResponseEntity>> getAddress();

  Future<Either<DioFailure, AddAddressResponseEntity>> removeAddress(
      String addressId);
}
