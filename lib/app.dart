import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'core/theme/theme.dart';
import 'core/routing/app_router.dart';

class WhisperfireApp extends StatelessWidget {
  const WhisperfireApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WHISPERFIRE',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: WFTheme.darkTheme,
    );
  }
} 