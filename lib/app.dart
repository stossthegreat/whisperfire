import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/theme.dart';
import 'core/routing/app_router.dart';

class WhisperfireApp extends ConsumerWidget {
  const WhisperfireApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    
    return MaterialApp.router(
      title: 'WHISPERFIRE',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: WFTheme.darkTheme,
    );
  }
}
