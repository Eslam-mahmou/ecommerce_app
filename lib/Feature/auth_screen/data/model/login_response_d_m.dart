import 'package:ecommerce_app/Feature/auth_screen/domain/entities/login_response_entities.dart';
import 'package:ecommerce_app/Feature/auth_screen/domain/entities/register_response_entities.dart';

class LoginResponseDM extends LoginResponseEntity {
  LoginResponseDM(
      {required super.message,
      required super.user,
      required super.token,
      super.statusMsg,
      super.msg});

  factory LoginResponseDM.fromJson(Map<String, dynamic> json) {
    return LoginResponseDM(
        message: json["message"]??"",
        msg:json["msg"]??"",
        statusMsg: json["statusMsg"]??"" ,
        user: LoginUserDm.fromJson(json["user"]),
        token: json["token"]);
  }
}

class LoginUserDm extends UserEntity {
  LoginUserDm({required super.name, required super.email, required super.role});

  factory LoginUserDm.fromJson(Map<String, dynamic> json) {
    return LoginUserDm(
        name: json["name"], email: json["email"], role: json["role"]);
  }
}

