import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/add_address_response_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/repository/profile_tab_repository.dart';
import 'package:ecommerce_app/core/Errors/dio_error.dart';

class ProfileTabUseCase {
  ProfileTabUseCase(this.profileTabRepository);

  ProfileTabRepository profileTabRepository;

  Future<Either<DioFailure, AddAddressResponseEntity>> callAddAddress(
      String home, String homeDetails, String phone, String city) async {
    return await profileTabRepository.addAddress(
        home, homeDetails, phone, city);
  }

  Future<Either<DioFailure, AddAddressResponseEntity>>
      executeGetAddress() async {
    return await profileTabRepository.getAddress();
  }

  Future<Either<DioFailure, AddAddressResponseEntity>> callRemoveAddress(
      String addressId) async {
    return await profileTabRepository.removeAddress(addressId);
  }
}
