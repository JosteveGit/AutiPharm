import 'dart:async';
import 'dart:core';
import 'package:auti_pharm/core/constants.dart';
import 'package:auti_pharm/core/models/authentication_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthenticationService {
  static Future<AuthenticationResponse> login(LoginDetails loginDetails) async {
    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
        email: loginDetails.email,
        password: loginDetails.password,
      );
      final FirebaseUser user = result.user;
      if (user != null) {
        return AuthenticationResponse(userID: user.uid);
      }
    } catch (e) {
      var exception = e as PlatformException;
      return AuthenticationResponse(
        message: exception.message,
        authenticationFailed: true,
      );
    }

    return AuthenticationResponse(
      message: "Something went wrong",
      authenticationFailed: true,
    );
  }

  static Future<AuthenticationResponse> register(
      RegisterDetails registerDetails) async {
    AuthenticationResponse createAccountResponse =
        await _createAuthAccount(registerDetails);
    if (createAccountResponse.authenticationFailed) {
      return createAccountResponse;
    }
    await _createDatabaseAccount(registerDetails, createAccountResponse.userID);
    return createAccountResponse;
  }

  static Future<AuthenticationResponse> _createAuthAccount(
      RegisterDetails registerDetails) async {
    try {
      final AuthResult result = await auth.createUserWithEmailAndPassword(
          email: registerDetails.email, password: registerDetails.password);
      final FirebaseUser user = result.user;
      if (user != null) {
        return AuthenticationResponse(userID: user.uid);
      }
    } catch (e) {
      var exception = e as PlatformException;
      return AuthenticationResponse(
        message: exception.message,
        authenticationFailed: true,
      );
    }
    return AuthenticationResponse(
      message: "Something went wrong",
      authenticationFailed: true,
    );
  }

  static Future<void> _createDatabaseAccount(
    RegisterDetails registerDetails,
    String authID,
  ) async {
    await database
        .reference()
        .child("Users")
        .child(authID)
        .child("Details")
        .set(registerDetails.toMap());
  }

  static Future<void> sendPasswordResetLink({String email}) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}
