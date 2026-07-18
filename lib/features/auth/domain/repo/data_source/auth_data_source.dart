import 'package:egy_film/features/auth/domain/entities/login/login_request_entity.dart';
import 'package:egy_film/features/auth/domain/entities/register/register_request_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:egy_film/features/auth/data/firebase/firebase_result.dart';

abstract class AuthDataSource {
  Future<FirebaseResult<UserCredential>> loginWithEmailAndPassword(
    LoginRequestEntity loginRequestEntity,
  );

  Future<FirebaseResult<RegisterRequestEntity>> register(
    RegisterRequestEntity registerRequestEntity,
  );

  Future<bool> loginWithGoogle();

  Future<void> sendOtpForNewUser(email);

  Future<void> sendOtpForExistingUser(email);

  Future<bool> validateOtp({
    required String email,
    required String otp,
  });

  Future<FirebaseResult<void>> resetPassword(
    RegisterRequestEntity registerRequestEntity,
  );

  Future<void> logout();
}
