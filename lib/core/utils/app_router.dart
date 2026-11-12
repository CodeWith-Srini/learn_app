import 'package:flutter/material.dart';
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
      // pageBuilder: (context, state) {
      //   return CustomTransitionPage(
      //     child: MobileDashboard(),
      //     transitionsBuilder: (context, animation, secondaryanimation, child) {
      //       final curvedAnimation = CurvedAnimation(
      //         parent: animation,
      //         curve: Curves.easeOutCubic,
      //       );

      //       return FadeTransition(
      //         opacity: curvedAnimation,
      //         child: SlideTransition(
      //           position: Tween<Offset>(
      //             begin: const Offset(0.1, 0),
      //             end: Offset.zero,
      //           ).animate(curvedAnimation),
      //           child: child,
      //         ),
      //       );
      //     },
      //   );
      // },
    ),
  ],
);
