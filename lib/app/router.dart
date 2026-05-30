import 'package:go_router/go_router.dart';

import '../features/auth/presentation/sign_in_screen.dart';
import '../features/monitoring/presentation/monitoring_dashboard_screen.dart';
import '../features/onboarding/presentation/permission_onboarding_screen.dart';

final appRouter = GoRouter(
  initialLocation: SignInScreen.routePath,
  routes: [
    GoRoute(
      path: SignInScreen.routePath,
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: PermissionOnboardingScreen.routePath,
      builder: (context, state) => const PermissionOnboardingScreen(),
    ),
    GoRoute(
      path: MonitoringDashboardScreen.routePath,
      builder: (context, state) => const MonitoringDashboardScreen(),
    ),
  ],
);
