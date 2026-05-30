import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../onboarding/presentation/permission_onboarding_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const routePath = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MotionGuard')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              Icon(Icons.shield,
                  size: 72, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 12),
              Text(
                'Protect this device with motion-aware monitoring.',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Sign in to enable trusted contacts, monitoring, and secure alerting.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const Spacer(),

              // Primary auth actions
              FilledButton.icon(
                onPressed: () =>
                    context.go(PermissionOnboardingScreen.routePath),
                icon: const Icon(Icons.login),
                label: const Text('Continue'),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.email_outlined),
                label: const Text('Sign in with Email'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {},
                child: const Text('Sign in with Google (mock)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
