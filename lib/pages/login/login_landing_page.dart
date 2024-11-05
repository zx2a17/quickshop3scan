import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshop/firebase/options.dart';
import 'package:quickshop/router.dart';

class LoginLandingPage extends ConsumerWidget {
  const LoginLandingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 64),
                Image.asset(
                  'assets/logo/logo.png',
                  height: 96,
                  width: 96,
                ),
                const SizedBox(height: 16),
                Text(
                  'Quickshop',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Colors.orange,
                        fontFamily: 'RacingSansOne',
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Rocket through your shopping',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontFamily: 'RacingSansOne',
                          color: Colors.grey[400],
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Consumer(builder: (context, ref, _) {
                    return ElevatedButton(
                      onPressed: () => ref.read(routerProvider).push(Routes.loginEmail),
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 11, horizontal: 11),
                        ),
                      ),
                      child: Stack(children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.email),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Continue with email',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.grey[600],
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ]),
                    );
                  }),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: AuthStateListener<OAuthController>(
                    child: OAuthProviderButton(
                      provider:
                          GoogleProvider(clientId: DefaultFirebaseOptions.googleSignInClientId),
                    ),
                    listener: (oldState, newState, ctrl) {
                      if (newState is SignedIn) {
                        ref.read(routerProvider).go(Routes.home);
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 96),
              ],
            ),
          ),
        );
      }),
    );
  }
}
