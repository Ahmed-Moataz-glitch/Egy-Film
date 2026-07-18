import 'package:egy_film/features/auth/data/firebase/firebase_result.dart';
import 'package:egy_film/features/auth/domain/entities/login/login_request_entity.dart';
import 'package:egy_film/features/auth/domain/entities/register/register_request_entity.dart';
import 'package:egy_film/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:egy_film/features/auth/domain/use_case/login_with_google_use_case.dart';
import 'package:egy_film/features/auth/domain/use_case/logout_use_case.dart';
import 'package:egy_film/features/auth/domain/use_case/register_use_case.dart';
import 'package:egy_film/features/auth/domain/use_case/reset_password_use_case.dart';
import 'package:egy_film/features/auth/domain/use_case/send_otp_for_existing_user_use_case.dart';
import 'package:egy_film/features/auth/domain/use_case/send_otp_for_new_user_use_case.dart';
import 'package:egy_film/features/auth/domain/use_case/validate_otp_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginWithEmailAndPasswordUseCase loginWithEmailAndPasswordUseCase;
  final RegisterUseCase registerUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;
  final SendOtpForNewUserUseCase sendOtpForNewUserUseCase;
  final SendOtpForExistingUserUseCase sendOtpForExistingUserUseCase;
  final ValidateOtpUseCase validateOtpUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final LogoutUseCase logoutUseCase;
  AuthCubit({
    required this.loginWithEmailAndPasswordUseCase,
    required this.registerUseCase,
    required this.loginWithGoogleUseCase,
    required this.sendOtpForNewUserUseCase,
    required this.sendOtpForExistingUserUseCase,
    required this.validateOtpUseCase,
    required this.resetPasswordUseCase,
    required this.logoutUseCase,
  }) : super(AuthInitial());

  Future<void> loginWithEmailAndPassword(
    LoginRequestEntity loginRequestEntity,
  ) async {
    emit(AuthLoading());
    try {
      final result = await loginWithEmailAndPasswordUseCase(
        loginRequestEntity,
      );
      switch (result) {
        case FirebaseSuccess<UserCredential>():
          emit(AuthSuccess('Login successful'));
        case FirebaseError<UserCredential>():
          emit(AuthError(result.message));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> register(RegisterRequestEntity registerRequestEntity) async {
    emit(AuthLoading());
    try {
      final result = await registerUseCase(registerRequestEntity);
      await sendOtpForNewUser(registerRequestEntity.email);
      switch (result) {
        case FirebaseSuccess<RegisterRequestEntity>():
          emit(AuthSuccess('Registration successful'));
        case FirebaseError<RegisterRequestEntity>():
          emit(AuthError(result.message));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> loginWithGoogle() async {
    final result = await loginWithGoogleUseCase();
    switch (result) {
      case true:
        emit(AuthSuccess('Login Successful'));
      case false:
        emit(AuthError("Login Failed"));
    }
  }

  Future<void> sendOtpForNewUser(String email) async {
    emit(SendingOtp());
    try {
      await sendOtpForNewUserUseCase(email);
      emit(OtpSent('OTP sent successfully'));
    } catch (e) {
      emit(SendingOtpError(e.toString()));
    }
  }

  Future<void> sendOtpForExistingUser(String email) async {
    emit(SendingOtp());
    try {
      await sendOtpForExistingUserUseCase(email);
      emit(OtpSent('OTP sent successfully'));
    } catch (e) {
      emit(SendingOtpError(e.toString()));
    }
  }

  Future<void> validateOtp({required String email, required String otp}) async {
    try {
      final result = await validateOtpUseCase(email: email, otp: otp);
      switch (result) {
        case true:
          emit(OtpVerified());
        case false:
          emit(VerifyingOtpError('Invalid OTP'));
      }
    } catch (e) {
      emit(VerifyingOtpError(e.toString()));
    }
  }

  Future<void> resetPassword(
    RegisterRequestEntity registerRequestEntity,
  ) async {
    try {
      final result = await resetPasswordUseCase(registerRequestEntity);
      switch (result) {
        case FirebaseSuccess<void>():
          emit(AuthSuccess('Reset password successful'));
        case FirebaseError<void>():
          emit(AuthError(result.message));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await logoutUseCase();
      emit(AuthSuccess('Logout Successful'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
