import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

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
        final cred = await _auth.signInWithPopup(provider);
        final user = cred.user;
        if (user == null) return null;
        return AuthUserCredential(AuthUser.fromFirebase(user));
      } else {
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

  Future<AuthUserCredential?> signInWithApple() async {
    // Implement per platform setup as needed
    throw UnsupportedError('Apple Sign-In requires platform setup');
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
