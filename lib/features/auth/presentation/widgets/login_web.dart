import 'package:flutter/material.dart';

import 'package:learn_app/features/auth/presentation/controllers/login_controller.dart';
import 'package:learn_app/features/auth/presentation/widgets/text_field.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/screen_utils.dart';

class LoginWeb extends StatefulWidget {
  const LoginWeb({super.key, required this.isMobile});

  final bool isMobile;

  @override
  State<LoginWeb> createState() => _LoginWebState();
}

class _LoginWebState extends State<LoginWeb> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = Screenutils.size(context);
    final controller = context.read<LoginController>();
    return Container(
      padding: EdgeInsets.all(size.width * 0.01),
      color: Colors.blueAccent,
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox.expand(
                child: Opacity(
                  opacity: 0.7,
                  child: Image.asset('assets/bg.jpg', fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          SizedBox(width: size.width * 0.01),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),

                color: Colors.white,
              ),
              child: Center(
                child: SizedBox(
                  width: size.width * 0.3,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                          label: 'Email',
                          isMobile: false,
                          isPassword: false,
                          controller: controller.userController,
                        ),
                        SizedBox(height: size.height * 0.02),
                        CustomTextField(
                          label: 'Password',
                          isMobile: false,
                          isPassword: true,
                          controller: controller.userController,
                        ),
                        SizedBox(height: size.height * 0.02),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                              Colors.blue,
                            ),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                          ),
                          onPressed: () {
                            controller.isPress = true;
                            if (!formKey.currentState!.validate()) {
                              return;
                            }
                            // controller.login();

                            // if (!context.mounted) return;

                            // if (controller.loginData != null) {
                            //   widget.isMobile == true
                            //       ? context.go('/mobile_dashboard')
                            //       : context.go('/web_dashboard');
                            // }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.01,
                              horizontal: size.width * 0.03,
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
