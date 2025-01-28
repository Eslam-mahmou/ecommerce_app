import '../../domain/entities/register_response_entities.dart';

class RegisterResponseDM extends RegisterResponseEntity {
  RegisterResponseDM(
      {required super.message,
      required super.user,
       super.statusMsg,
      required super.token,
      this.msg});
String? msg;
  factory RegisterResponseDM.fromJson(Map<String, dynamic> json) {
    return RegisterResponseDM(
        message: json["message"] ,
        msg:json["msg"]??"",
        user: UserDM.fromJson(json["user"]),
        statusMsg: json["statusMsg"]??"" ,
        token: json["token"]);
  }
}

class UserDM extends UserEntity {
  UserDM({required super.name, required super.email, required super.role});
  factory UserDM.fromJson(Map<String ,dynamic>json){
    return UserDM(
        name: json["name"],
        email: json["email"],
        role: json["role"]);
  }
}
