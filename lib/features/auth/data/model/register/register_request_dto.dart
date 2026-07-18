import 'package:egy_film/features/auth/domain/entities/register/register_request_entity.dart';

class RegisterRequestDto {
  static const String collection = 'users';
  String? id;
  String? name;
  String? email;
  String? password;

  RegisterRequestDto({this.id, this.name, this.email, this.password});

  RegisterRequestDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'password': password};
  }

  RegisterRequestEntity toEntity() {
    return RegisterRequestEntity(
      name: name ?? '',
      email: email ?? '',
      password: password ?? '',
    );
  }
}
