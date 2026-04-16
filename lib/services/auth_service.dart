import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Permet à l'application de savoir en temps réel si quelqu'un est connecté
  Stream<User?> get user => _auth.authStateChanges();

  // Fonction de connexion Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Déclenche le menu de sélection de compte Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // L'utilisateur a quitté sans choisir de compte

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Crée l'identifiant pour Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Connecte l'utilisateur sur Firebase
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print("Erreur Authentification Google : $e");
      return null;
    }
  }

  // Déconnexion
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}