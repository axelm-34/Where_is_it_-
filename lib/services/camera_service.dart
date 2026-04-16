import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Stream pour savoir en temps réel si l'utilisateur est connecté
  Stream<User?> get user => _auth.authStateChanges();

  // Connexion avec Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Déclencher le flux d'authentification Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // L'utilisateur a annulé

      // Obtenir les détails d'authentification de la demande
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Créer un nouvel identifiant
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Une fois connecté, renvoyer l'UserCredential
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print("Erreur lors de la connexion Google: $e");
      return null;
    }
  }

  // Déconnexion
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}