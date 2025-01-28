class AddAddressResponseEntity {
  String? status;
  String? message;
  List<AddAddressDataEntity>? data;

  AddAddressResponseEntity({
     this.status,
     this.message,
     this.data,
  });
}

class AddAddressDataEntity {
  String? id;
  String? name;
  String? details;

  String? city;
  String? phone;

  AddAddressDataEntity(
      {this.id, this.name, this.details, this.city, this.phone});
}
