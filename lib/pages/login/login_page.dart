import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshop/analytics/analytics.dart';
import 'package:quickshop/analytics/crash_reporter.dart';
import 'package:quickshop/router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return SignInScreen(
        headerBuilder: (ctx, constraints, shrinkOffset) {
          return Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo/logo.png',
                  height: 64,
                  width: 64,
                ),
                Text(
                  'Rocket through your shopping with Quickshop',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontFamily: 'RacingSansOne',
                        color: Colors.orange,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
        actions: [
          AuthStateChangeAction((context, state) {
            if (state is SigningIn) {
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
      );
    });
  }
}
