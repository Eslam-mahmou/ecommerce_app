class RegisterResponseEntity {
  final String message;
  final UserEntity user;
  final String ?statusMsg;
  final String token;

  RegisterResponseEntity(
      {required this.message,
      required this.user,
       this.statusMsg,
      required this.token});
}

class UserEntity {
  final String name;
  final String email;
  final String role;

  UserEntity({required this.name, required this.email, required this.role});
}
