// ignore_for_file: override_on_non_overriding_member
import 'package:egy_film/features/auth/data/firebase/firebase_result.dart';
import 'package:egy_film/features/auth/domain/entities/login/login_request_entity.dart';
import 'package:egy_film/features/auth/domain/entities/register/register_request_entity.dart';
import 'package:egy_film/features/auth/domain/repo/data_source/auth_data_source.dart';
import 'package:egy_film/features/auth/domain/repo/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource _authDataSource;

  AuthRepoImpl(this._authDataSource);

  @override
  Future<FirebaseResult<UserCredential>> loginWithEmailAndPassword(
    LoginRequestEntity loginRequestEntity,
  ) {
    return _authDataSource.loginWithEmailAndPassword(loginRequestEntity);
  }

  @override
  Future<FirebaseResult<RegisterRequestEntity>> register(
    RegisterRequestEntity registerRequestEntity,
  ) {
    return _authDataSource.register(registerRequestEntity);
  }

  @override
  Future<bool> loginWithGoogle() {
    return _authDataSource.loginWithGoogle();
  }

  @override
  Future<FirebaseResult<void>> resetPassword(RegisterRequestEntity registerRequestEntity) {
    return _authDataSource.resetPassword(registerRequestEntity);
  }
  
  @override
  Future<void> logout() {
    return _authDataSource.logout();
  }
  
  @override
  Future<void> sendOtpForNewUser(email) {
    return _authDataSource.sendOtpForNewUser(email);
  }

  @override
  Future<void> sendOtpForExistingUser(email){
    return _authDataSource.sendOtpForExistingUser(email);
  }
  
  @override
  Future<bool> validateOtp({required String email, required String otp}) {
    return _authDataSource.validateOtp(email: email, otp: otp);
  }
}
