import 'dart:async';

class LocalAuthService {
  static final LocalAuthService _instance = LocalAuthService._internal();

  factory LocalAuthService() => _instance;

  LocalAuthService._internal();

  final StreamController<bool> _authController = StreamController<bool>.broadcast();

  bool _isLoggedIn = false;

  Stream<bool> get authState => _authController.stream;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    _authController.add(true);
  }

  void logout() {
    _isLoggedIn = false;
    _authController.add(false);
  }
}