class LoginResponseEntity {
  bool success;
  String token;
  User user;

  LoginResponseEntity({
    this.success = false,
    this.token = '',
    this.user = const User(
      id: '',
      name: '',
      email: '',
      avatar: '',
      role: '',
      githubId: '',
      isActive: false,
      emailVerified: false,
    ),
  });
}

class User {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String role;
  final String githubId;
  final bool isActive;
  final bool emailVerified;

  const User({
    this.id = '',
    this.name = '',
    this.email = '',
    this.avatar = '',
    this.role = '',
    this.githubId = '',
    this.isActive = false,
    this.emailVerified = false,
  });
}
