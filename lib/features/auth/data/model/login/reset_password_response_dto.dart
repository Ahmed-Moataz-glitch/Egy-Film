import 'package:egy_film/features/auth/domain/entities/login/reset_password_response_entity.dart';

class ResetPasswordResponseDto {
  bool? success;
  String? token;
  UserEntity? user;

  ResetPasswordResponseDto({this.success, this.token, this.user});

  ResetPasswordResponseDto.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    user = json['user'] != null ? UserEntity.fromJson(json['user']) : null;
  }

  ResetPasswordResponseEntity toEntity() {
    return ResetPasswordResponseEntity(
      success: success ?? false,
      token: token ?? '',
      user: User(
        id: user?.id ?? '',
        name: user?.name ?? '',
        email: user?.email ?? '',
        avatar: user?.avatar ?? '',
        role: user?.role ?? '',
        githubId: user?.githubId ?? '',
        isActive: user?.isActive ?? false,
        emailVerified: user?.emailVerified ?? false,
        createdAt: user?.createdAt ?? '',
        updatedAt: user?.updatedAt ?? '',
      ),
    );
  }
}

class UserEntity {
  String? id;
  String? name;
  String? email;
  String? avatar;
  String? role;
  String? githubId;
  bool? isActive;
  bool? emailVerified;
  String? createdAt;
  String? updatedAt;

  UserEntity(
      {this.id,
      this.name,
      this.email,
      this.avatar,
      this.role,
      this.githubId,
      this.isActive,
      this.emailVerified,
      this.createdAt,
      this.updatedAt});

  UserEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    role = json['role'];
    githubId = json['githubId'];
    isActive = json['isActive'];
    emailVerified = json['emailVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id ?? '',
      name: name ?? '',
      email: email ?? '',
      avatar: avatar ?? '',
      role: role ?? '',
      githubId: githubId ?? '',
      isActive: isActive ?? false,
      emailVerified: emailVerified ?? false,
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
    );
  }
}
