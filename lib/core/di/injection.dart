import 'package:learn_app/core/services/api_service.dart';
import 'package:learn_app/features/auth/data/services/login_service.dart';
import 'package:learn_app/features/auth/presentation/controllers/login_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final dioClient = DioClient();

final authService = AuthService(dio: dioClient.dio);

List<SingleChildWidget> appProvider = [
  ChangeNotifierProvider<LoginController>(
    create: (context) => LoginController(authService: authService),
  ),
];
