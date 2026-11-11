import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learn_app/features/auth/presentation/widgets/login_mobile.dart';

import '../widgets/login_web.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        log('IsMobile - $isMobile');
        return Scaffold(
          backgroundColor: Colors.transparent,

          body: SafeArea(
            child:
                constraints.maxWidth < 600
                    ? LoginMobile(isMobile: isMobile)
                    : LoginWeb(isMobile: isMobile),
          ),
        );
      },
    );
  }
}
