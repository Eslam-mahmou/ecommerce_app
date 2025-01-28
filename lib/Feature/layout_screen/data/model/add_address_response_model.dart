import 'package:ecommerce_app/Feature/layout_screen/domain/entities/add_address_response_entity.dart';

class AddAddressResponseModel extends AddAddressResponseEntity {
  AddAddressResponseModel(
      {super.status, super.message, super.data, this.statusMsg});

  String? statusMsg;

  AddAddressResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusMsg=json["statusMsg"];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(AddAddressDataModel.fromJson(v));
      });
    }
  }
}

class AddAddressDataModel extends AddAddressDataEntity {
  AddAddressDataModel({
    super.id,
    super.name,
    super.details,
    super.phone,
    super.city,
  });

  AddAddressDataModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    details = json['details'];
    phone = json['phone'];
    city = json['city'];
  }
}
