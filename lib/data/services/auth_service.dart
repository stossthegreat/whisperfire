import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'dart:math';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class AuthUser {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoURL;
  const AuthUser({required this.uid, this.email, this.displayName, this.photoURL});

  factory AuthUser.fromFirebase(fb.User user) {
    return AuthUser(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoURL: user.photoURL,
    );
  }
}

class AuthUserCredential {
  final AuthUser user;
  const AuthUserCredential(this.user);
}

class AuthService {
  final fb.FirebaseAuth _auth = fb.FirebaseAuth.instance;

  AuthUser? get currentUser => _auth.currentUser != null
      ? AuthUser.fromFirebase(_auth.currentUser!)
      : null;

  Stream<AuthUser?> get authStateChanges => _auth.authStateChanges().map((u) => u != null ? AuthUser.fromFirebase(u) : null);

  Future<AuthUserCredential?> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        final provider = fb.GoogleAuthProvider();
        // Force account chooser on web
        provider.setCustomParameters({'prompt': 'select_account'});
        final cred = await _auth.signInWithPopup(provider);
        final user = cred.user;
        if (user == null) return null;
        return AuthUserCredential(AuthUser.fromFirebase(user));
      } else {
        // If a previous session exists, GoogleSignIn may auto-select.
        // After a proper signOut() (below), this will show the chooser.
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if (googleUser == null) return null;
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final credential = fb.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final cred = await _auth.signInWithCredential(credential);
        final user = cred.user;
        if (user == null) return null;
        return AuthUserCredential(AuthUser.fromFirebase(user));
      }
    } catch (e) {
      if (kDebugMode) print('Google sign-in error: $e');
      rethrow;
    }
  }

  // Generates a cryptographically secure random nonce, to be included in a credential request.
  String _generateNonce([int length = 32]) {
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }

  // Returns the sha256 hash of [input] in hex notation.
  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<AuthUserCredential?> signInWithApple() async {
    try {
      final rawNonce = _generateNonce();
      final nonce = _sha256ofString(rawNonce);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential = fb.OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      final cred = await _auth.signInWithCredential(oauthCredential);
      final user = cred.user;
      if (user == null) return null;

      // Optionally update display name with Apple full name on first sign-in
      if ((user.displayName == null || user.displayName!.isEmpty) && appleCredential.givenName != null) {
        await user.updateDisplayName('${appleCredential.givenName ?? ''} ${appleCredential.familyName ?? ''}'.trim());
      }

      return AuthUserCredential(AuthUser.fromFirebase(user));
    } catch (e) {
      if (kDebugMode) print('Apple sign-in error: $e');
      rethrow;
    }
  }

  Future<AuthUserCredential?> signInWithEmailAndPassword(String email, String password) async {
    final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
    final user = cred.user;
    if (user == null) return null;
    return AuthUserCredential(AuthUser.fromFirebase(user));
  }

  Future<AuthUserCredential?> createUserWithEmailAndPassword(String email, String password) async {
    final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final user = cred.user;
    if (user == null) return null;
    return AuthUserCredential(AuthUser.fromFirebase(user));
  }

  Future<void> signOut() async {
    // Clear Google session so chooser appears next time after sign-out
    if (!kIsWeb) {
      try {
        final google = GoogleSignIn();
        await google.signOut();
        await google.disconnect();
      } catch (_) {}
    }
    await _auth.signOut();
  }

  Future<void> deleteAccount() async {
    await _auth.currentUser?.delete();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateUserProfile({String? displayName, String? photoURL}) async {
    final user = _auth.currentUser;
    if (user == null) return;
    await user.updateDisplayName(displayName);
    await user.updatePhotoURL(photoURL);
  }
}
