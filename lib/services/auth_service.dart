import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        final GoogleAuthProvider googleProvider = GoogleAuthProvider();

        return await _auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        if (googleUser == null) {
          return null;
        }

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        return await _auth.signInWithCredential(credential);
      }
    } catch (e) {
      print('Google Sign-In error: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();

    if (!kIsWeb) {
      await GoogleSignIn().signOut();
    }
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;
}