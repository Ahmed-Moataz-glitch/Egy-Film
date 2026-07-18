import 'package:egy_film/features/auth/data/firebase/firebase_authentication.dart';
import 'package:egy_film/features/auth/data/firebase/firebase_result.dart';
import 'package:egy_film/features/auth/data/model/login/login_request_dto.dart';
import 'package:egy_film/features/auth/data/model/register/register_request_dto.dart';
import 'package:egy_film/features/auth/domain/entities/login/login_request_entity.dart';
import 'package:egy_film/features/auth/domain/entities/register/register_request_entity.dart';
import 'package:egy_film/features/auth/domain/repo/data_source/auth_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuthentication _firebaseAuthentication;

  AuthDataSourceImpl(this._firebaseAuthentication);

  @override
  Future<FirebaseResult<UserCredential>> loginWithEmailAndPassword(
    LoginRequestEntity loginRequestEntity,
  ) async {
    final result = await _firebaseAuthentication.loginWithEmailAndPassword(
      LoginRequestDto(
        email: loginRequestEntity.email,
        password: loginRequestEntity.password,
      ),
    );
    switch (result) {
      case FirebaseSuccess<UserCredential>():
        return FirebaseSuccess<UserCredential>(result.data);
      case FirebaseError<UserCredential>():
        return FirebaseError<UserCredential>(result.message);
    }
  }

  @override
  Future<FirebaseResult<RegisterRequestEntity>> register(
    RegisterRequestEntity registerRequestEntity,
  ) async {
    final result = await _firebaseAuthentication.register(
      RegisterRequestDto(
        email: registerRequestEntity.email,
        password: registerRequestEntity.password,
      ),
    );
    switch (result) {
      case FirebaseSuccess<RegisterRequestDto>():
        return FirebaseSuccess<RegisterRequestEntity>(result.data?.toEntity());
      case FirebaseError<RegisterRequestDto>():
        return FirebaseError<RegisterRequestEntity>(result.message);
    }
  }

  @override
  Future<bool> loginWithGoogle() {
    return _firebaseAuthentication.loginWithGoogle();
  }

  @override
  Future<FirebaseResult<void>> resetPassword(
    RegisterRequestEntity registerRequestEntity,
  ) {
    return _firebaseAuthentication.resetPassword(
      RegisterRequestDto(
        email: registerRequestEntity.email,
        password: registerRequestEntity.password,
      ),
    );
  }

  @override
  Future<void> logout() {
    return _firebaseAuthentication.logout();
  }

  @override
  Future<void> sendOtpForNewUser(email) {
    return _firebaseAuthentication.sendOtpForNewUser(email);
  }

  @override
  Future<void> sendOtpForExistingUser(email) {
    return _firebaseAuthentication.sendOtpForExistingUser(email);
  }

  @override
  Future<bool> validateOtp({
    required String email,
    required String otp,
  }) {
    return _firebaseAuthentication.validateOtp(
      email: email,
      otp: otp,
    );
  }
}
