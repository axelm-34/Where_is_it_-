import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'services/auth_service.dart';

void main() async {
  // Indispensable pour Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Where Is It',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // On écoute l'état de l'authentification pour savoir quel écran afficher
      home: StreamBuilder<User?>(
        stream: AuthService().user, // On écoute l'état de connexion [cite: 174]
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen(); // Si connecté -> Accueil [cite: 173]
          }
          return const LoginScreen(); // Sinon -> Connexion
        },
      ),
    );
  }
}