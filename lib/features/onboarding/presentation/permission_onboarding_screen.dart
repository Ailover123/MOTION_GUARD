import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../monitoring/presentation/monitoring_dashboard_screen.dart';

class PermissionOnboardingScreen extends StatelessWidget {
  const PermissionOnboardingScreen({super.key});

  static const routePath = '/permissions';

  @override
  Widget build(BuildContext context) {
    final permissions = [
      'Notifications for persistent monitoring and alarm controls',
      'Location for trusted-contact alert telemetry',
      'Foreground service access for Android background monitoring',
      'Device admin setup for Android lock attempt tracking',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Permission setup')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MotionGuard needs explicit permission before monitoring.',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: permissions.length,
                  separatorBuilder: (_, __) => const Divider(height: 8),
                  itemBuilder: (context, idx) {
                    return SwitchListTile(
                      value: false,
                      onChanged: (_) {},
                      title: Text(permissions[idx]),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () =>
                          context.go(MonitoringDashboardScreen.routePath),
                      child: const Text('Request Permissions'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
