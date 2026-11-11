import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:learn_app/core/utils/screen_utils.dart';
import 'package:learn_app/features/auth/presentation/controllers/login_controller.dart';
import 'package:learn_app/features/auth/presentation/widgets/text_field.dart';
import 'package:learn_app/shared/pressable_btn.dart';
import 'package:provider/provider.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key, required this.isMobile});

  final bool isMobile;

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  final GlobalKey<FormState> formkey = GlobalKey();
  bool isPress = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((T) {
      context.read<LoginController>().initState();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = Screenutils.size(context);
    final controller = context.read<LoginController>();
    // final controllerW = context.watch<LoginController>();
    log('Rebuild');
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: Center(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(
                // angle: 6.1,
                angle: 0,
                child: const Text(
                  '🛸',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),

              CustomTextField(
                label: 'Email',
                isMobile: true,
                isPassword: false,
                controller: controller.userController,
              ),
              SizedBox(height: size.height * 0.02),
              CustomTextField(
                label: 'Password',
                isMobile: true,
                isPassword: true,
                controller: controller.passwordController,
              ),
              SizedBox(height: size.height * 0.02),
              PressableButton(isPress: isPress, title: 'Login'),
            ],
          ),
        ),
      ),
    );
  }
}
