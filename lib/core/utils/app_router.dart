import 'package:go_router/go_router.dart';
import 'package:learn_app/features/auth/presentation/screens/login_page.dart';
import 'package:learn_app/features/dashboard/presentation/screens/mobile_dashboard.dart';
import 'package:learn_app/features/dashboard/presentation/screens/web_dashboard.dart';

final GoRouter appRoute = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => LoginPage()),
    // GoRoute(path: '/Dashboard', builder: (context, state) => DashboardPage()),
    GoRoute(
      path: '/web_dashboard',
      builder: (context, state) => WebDashboard(),
    ),
    GoRoute(
      path: '/mobile_dashboard',
      builder: (context, state) => MobileDashboard(),
    ),
  ],
);
