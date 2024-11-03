import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Welcome, ${user.displayName}!'),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Unexpected state returned from Firebase Sign In: $state',
                ),
              ),
            );
            print(StackTrace.current);
          }
        }),
      ],
    );
  }
}
