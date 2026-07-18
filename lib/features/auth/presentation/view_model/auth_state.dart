part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class SendingOtp extends AuthState {}

final class OtpSent extends AuthState {
  final String message;

  OtpSent(this.message);
}

final class SendingOtpError extends AuthState {
  final String message;

  SendingOtpError(this.message);
}

final class VerifyingOtp extends AuthState {}

final class OtpVerified extends AuthState {}

final class VerifyingOtpError extends AuthState {
  final String message;

  VerifyingOtpError(this.message);
}

final class AuthSuccess extends AuthState {
  final String message;

  AuthSuccess(this.message);
}

final class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
