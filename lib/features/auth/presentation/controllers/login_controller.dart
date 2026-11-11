import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learn_app/features/auth/data/models/login_model.dart';
import 'package:learn_app/features/auth/data/services/login_service.dart';

class LoginController extends ChangeNotifier {
  final AuthService authService;

  LoginController({required this.authService});

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPress = false;
  bool isLoading = false;
  String? errorMessage;
  LoginModel? loginData;

  void initState() {
    isPress = false;
    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final result = await authService.login(
        'eve.holt@reqres.in',
        'citdfdfgdfggyslicka',
      );

      if (result.token != null) {
        log('Login Success: ${result.token}');
      } else {
        errorMessage = result.error ?? 'Login failed';
        log('Login Failed: $errorMessage');
      }
    } catch (e) {
      errorMessage = e.toString();
      log('Exception: $errorMessage');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
