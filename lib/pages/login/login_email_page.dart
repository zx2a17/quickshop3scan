import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshop/analytics/analytics.dart';
import 'package:quickshop/analytics/crash_reporter.dart';
import 'package:quickshop/router.dart';

class LoginEmailPage extends StatelessWidget {
  const LoginEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Scaffold(
        appBar: AppBar(),
        body: SignInScreen(
          providers: [
            EmailAuthProvider(),
          ],
          actions: [
            AuthStateChangeAction((context, state) {
              if (state is SigningIn) {
                return;
              }
              if (state is AuthFailed) {
                ref.read(crashReporterProvider).report(state.exception, StackTrace.current);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('An unexpected error occurred. Please try again later'),
                ));
                return;
              }
              final user = switch (state) {
                SignedIn(user: final user) => user,
                CredentialLinked(user: final user) => user,
                UserCreated(credential: final cred) => cred.user,
                _ => null,
              };
              if (user != null) {
                ref.read(routerProvider).go(Routes.home);
                ref.read(analyticsProvider).logEvent(const AnalyticsEvent.login());
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Welcome, ${user.displayName}!'),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('An unexpected error occurred. Please try again later'),
                ));
                final errorMessage = 'Unexpected state returned from Firebase Sign In: $state';
                ref.read(crashReporterProvider).report(errorMessage, StackTrace.current);
              }
            }),
          ],
        ),
      );
    });
  }
}
