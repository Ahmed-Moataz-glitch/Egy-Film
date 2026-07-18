// ignore_for_file: unused_local_variable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egy_film/core/utils/secure_storage.dart';
import 'package:egy_film/features/auth/data/firebase/firebase_result.dart';
import 'package:egy_film/features/auth/data/model/login/login_request_dto.dart';
import 'package:egy_film/features/auth/data/model/register/register_request_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FirebaseAuthentication {
  final _firebaseAuth = FirebaseAuth.instance;
  final supabase = Supabase.instance.client;
  Future<FirebaseResult<RegisterRequestDto>> register(
    RegisterRequestDto registerRequestDto,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: registerRequestDto.email!,
            password: registerRequestDto.password!,
          );
      registerRequestDto.id = credential.user?.uid;
      await _getCollection.doc(registerRequestDto.id).set(registerRequestDto);
      return FirebaseSuccess(registerRequestDto);
    } catch (e) {
      return FirebaseError(e.toString());
    }
  }

  CollectionReference<RegisterRequestDto> get _getCollection {
    return FirebaseFirestore.instance
        .collection(RegisterRequestDto.collection)
        .withConverter<RegisterRequestDto>(
          fromFirestore: (snapshot, _) =>
              RegisterRequestDto.fromJson(snapshot.data()!),
          toFirestore: (registerRequestDto, _) => registerRequestDto.toJson(),
        );
  }

  Future<void> updateUserData(RegisterRequestDto registerRequestDto) async {
    try {
      _firebaseAuth.currentUser!.updatePassword(registerRequestDto.password!);
    } catch (e) {
      throw 'Error from update user data $e';
    }
  }

  Future<FirebaseResult<UserCredential>> loginWithEmailAndPassword(
    LoginRequestDto loginRequestDto,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginRequestDto.email!,
        password: loginRequestDto.password!,
      );
      await SecureStorage.saveToken(credential.user?.uid ?? '');
      return FirebaseSuccess(credential);
    } catch (e) {
      return FirebaseError(e.toString());
    }
  }

  Future<bool> loginWithGoogle() async {
    try {
      final gUser = await GoogleSignIn().signIn();
      final gAuth = await gUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth?.accessToken,
        idToken: gAuth?.idToken,
      );
      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
      return userCredential.user != null;
    } catch (_) {
      return false;
    }
  }

  Future<void> sendOtpForNewUser(String email) async {
    try {
      await supabase.auth.signInWithOtp(email: email, shouldCreateUser: true);
    } catch (e) {
      throw 'Error from send OTP for new user $e';
    }
  }

  Future<void> sendOtpForExistingUser(String email) async {
    try {
      await supabase.auth.signInWithOtp(email: email, shouldCreateUser: false);
    } catch (e) {
      throw 'Error from send OTP for existing user $e';
    }
  }

  Future<bool> validateOtp({required String email, required String otp}) async {
    try {
      final result = await supabase.auth.verifyOTP(
        type: OtpType.email,
        email: email,
        token: otp,
      );
      return result.session != null;
    } catch (e) {
      throw 'Error from verify OTP $e';
    }
  }

  Future<FirebaseResult<void>> resetPassword(
    RegisterRequestDto registerRequestDto,
  ) async {
    try {
      await updateUserData(registerRequestDto);
      final user = _getCollection.doc(registerRequestDto.id);
      user.set(registerRequestDto, SetOptions(mergeFields: ['password']));
      return FirebaseSuccess(null);
    } catch (e) {
      return FirebaseError(e.toString());
    }
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw 'Error from logout $e';
    }
  }
}
