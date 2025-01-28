import 'package:ecommerce_app/Feature/auth_screen/domain/entities/register_response_entities.dart';

class LoginResponseEntity {
  final String message;
  final UserEntity user;
  final String ?statusMsg;
  final String token;
 final String? msg;
  LoginResponseEntity({required this.message,
    required this.user,
    this.statusMsg,
    required this.token,
    this.msg
});
}

