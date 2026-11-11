// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:learn_app/features/auth/data/models/login_model.dart';

// class AuthService {
//   final Dio dio;

//   AuthService({required this.dio});

//   Future<LoginModel> login({required String email, required String password}) {
//     try {
//       final response = dio.post(
//         '/login',
//         data: {'email': email, 'password': password},
//       );
//     } catch (e) {}
//     // return dio.post('/login', data: {'email': email, 'password': password});
//   }
// }

import 'dart:convert';

import 'package:learn_app/features/auth/data/models/login_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static Future<LoginModel> login() async {
    try {
      final response = await http.get(
        Uri.parse('https://reqres.in/api/login'),
        headers: {'Content-Type': 'application/json'},
      );

      final data = jsonDecode(response.body);

      return LoginModel.fromJson(data, response.statusCode);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
