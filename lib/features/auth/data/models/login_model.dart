class LoginModel {
  final String? token;
  final String? error;
  int? rescode;

  LoginModel({required this.rescode, this.error, this.token});

  factory LoginModel.fromJson(Map<String, dynamic> jsons, int rescode) {
    return LoginModel(
      rescode: rescode,
      token: jsons['token'],
      error: jsons['error'],
    );
  }

  factory LoginModel.issue(String? jsons, int rescode) {
    return LoginModel(rescode: rescode, token: null, error: jsons);
  }
}
