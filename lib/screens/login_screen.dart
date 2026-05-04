import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthService _authService = AuthService();

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    print("Bouton Google cliqué");

    final userCredential = await _authService.signInWithGoogle();

    if (userCredential == null) {
      print("Connexion Google annulée ou échouée");
      return;
    }

    print("Connexion Google réussie : ${userCredential.user?.email}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.search,
                    size: 90,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Objets trouvés',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Connectez-vous pour continuer',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: () => _handleGoogleSignIn(context),
                      icon: const Icon(Icons.login),
                      label: const Text("Se connecter avec Google"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}