import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshop/analytics/analytics.dart';
import 'package:quickshop/analytics/crash_reporter.dart';
import 'package:quickshop/router.dart';

/// Uses FirebaseUI page to handle email login and registration. Errors are handled automatically
/// in the following cases:
/// 1. Attempt to sign in with email but no account found:
///   - FirebaseAuthException with code 'user-not-found'
///   - Message displayed to user: 'There is no user record corresponding to this identifier. The user may have been deleted.'
/// 2. Attempt to sign in with email but wrong password:
///  - FirebaseAuthException with code 'wrong-password'
///  - Message displayed to user: 'The password is invalid or the user does not have a password.'
/// 3. Attempt to sign in with email but already signed up with google:
///  - FirebaseAuthException with code 'wrong-password'
///  - Message displayed to user: 'The password is invalid or the user does not have a password.'
/// 4. Attempt to register with email but already signed up with google
///  - FirebaseAuthException with code 'email-already-in-use'
///  - Message displayed to user: 'The email address is already in use by another account.'
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
              if (state is SigningIn || state is SigningUp) {
                return;
              }
              if (state is AuthFailed) {
                var exception = state.exception;
                // Firebase auth exceptions *should* result in the firebase_ui_auth library
                // displaying a user-friendly error message. Log the event for analytics
                // in case further investigation is needed.
                if (exception is auth.FirebaseAuthException) {
                  ref.read(analyticsProvider).logEvent(AnalyticsEvent.loginFailed(
                        errorCode: exception.code,
                        errorMessage: exception.message ?? '',
                      ));
                  return;
                }
                // Show a generic snackbar for all other exceptions and report the exception
                else {
                  ref.read(crashReporterProvider).report(state.exception, StackTrace.current);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('An unexpected error occurred. Please try again later'),
                  ));
                  return;
                }
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
