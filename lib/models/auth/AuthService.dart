import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserAttribute {
  String? sub; //WARN: subがnullかどうかでログイン状態を判定している
  String? email;
  String? emailVerified;
  String? identities;

  UserAttribute();
}

class AuthService {
  bool isSignedIn = false;

  static Future<AuthUser> getCurrentUser() async {
    return await Amplify.Auth.getCurrentUser();
  }

  static Future<UserAttribute> getCurrentUserAttribute() async {
    var attributes = await Amplify.Auth.fetchUserAttributes();
    var userAttribute = UserAttribute();

    for (var attribute in attributes) {
      if (attribute.userAttributeKey.key == 'sub') {
        userAttribute.sub = attribute.value;
      }
      if (attribute.userAttributeKey.key == 'email') {
        userAttribute.email = attribute.value;
      }
      if (attribute.userAttributeKey.key == 'email_verified') {
        userAttribute.emailVerified = attribute.value;
      }
      if (attribute.userAttributeKey.key == 'identities') {
        userAttribute.identities = attribute.value;
      }
    }
    return userAttribute;
  }

  static Future<AuthSession> get authSession async {
    return await Amplify.Auth.fetchAuthSession();
  }

  static Future<void> signOut() async {
    await Amplify.Auth.signOut();
    print("signed out");
  }

  static Future<void> signInWithFacebook(BuildContext context) async {
    try {
      var res = await Amplify.Auth.signInWithWebUI(
        provider: AuthProvider.facebook,
      );
      if (res.isSignedIn) {
        Navigator.pop(context);
      }
    } on AmplifyException catch (e) {
      print(e.message);
    }
  }

  static Future<void> signInWithGoogle(BuildContext context) async {
    try {
      var res = await Amplify.Auth.signInWithWebUI(
        provider: AuthProvider.google,
      );
      if (res.isSignedIn) {
        Navigator.pop(context);
      }
    } on AmplifyException catch (e) {
      print(e.message);
    }
  }

  static Future<void> signInWithEmail(BuildContext context) async {
    try {
      var res = await Amplify.Auth.signInWithWebUI();
      if (res.isSignedIn) {
        Navigator.pop(context);
      }
    } on AmplifyException catch (e) {
      print(e.message);
    }
  }

  static Future<void> signInWithApple(BuildContext context) async {
    try {
      var res = await Amplify.Auth.signInWithWebUI(
        provider: AuthProvider.apple,
      );
      if (res.isSignedIn) {
        Navigator.pop(context);
      }
    } on AmplifyException catch (e) {
      print(e.message);
    }
  }

  static Future<String?> getJwt() async {
    try {
      final resp = await Amplify.Auth.fetchAuthSession(
        options: CognitoSessionOptions(getAWSCredentials: true),
      );
      if (resp.isSignedIn) {
        final sess = resp as CognitoAuthSession;
        return sess.userPoolTokens?.idToken;
      }
      return null;
    } on AmplifyException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return null;
    }
  }

  static Future<Object?> getHeader() async {
    var jwt = await getJwt();
    if (jwt != null) {
      return {'Authorization': 'Bearer $jwt'};
    }
    return null;
  }
}
