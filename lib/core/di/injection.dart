import 'package:learn_app/features/auth/presentation/controllers/login_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProvider = [
  // Provider<DioClient>(
  //   create: (_) => DioClient(),
  //   dispose: (_, client) => client.dio.close(),
  // ),

  // Provider<AuthService>(
  //   create: (context) => AuthService(dio: context.read<DioClient>().dio),
  // ),
  ChangeNotifierProvider<LoginController>(
    create: (context) => LoginController(),
  ),
];
