import 'package:dio/dio.dart';
import 'package:learn_app/features/auth/data/models/login_model.dart';

class AuthService {
  final Dio dio;

  AuthService({required this.dio});

  Future<LoginModel> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/login',
        data: {'email': email, 'password': password},
      );
      return LoginModel.fromJson(response.data, response.statusCode!);
    } on DioException catch (e) {
      final responsedata = e.response?.data;

      String message = 'Something went wrong';

      if (responsedata is Map) {
        message = responsedata['error'];
      } else {
        message = e.message!;
      }

      return LoginModel.issue(message, e.response!.statusCode!);
    } catch (e) {
      return LoginModel.issue(e.toString(), 500);
    }
  }
}
