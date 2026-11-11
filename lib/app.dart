import 'package:flutter/material.dart';
import 'package:learn_app/core/di/injection.dart';
import 'package:learn_app/core/utils/app_router.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProvider,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRoute,
      ),
    );
  }
}
