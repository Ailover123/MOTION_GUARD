import 'package:flutter/material.dart';

import 'router.dart';
import 'theme.dart';

class MotionGuardApp extends StatelessWidget {
  const MotionGuardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MotionGuard',
      debugShowCheckedModeBanner: false,
      theme: buildMotionGuardTheme(),
      routerConfig: appRouter,
    );
  }
}
