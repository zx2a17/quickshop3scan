import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshop/analytics/analytics.dart';
import 'package:quickshop/repositories/user_repo.dart';
import 'package:quickshop/router.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userProvider);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Colors.white,
                ),
                Text(
                  user?.name ?? user?.email ?? 'Guest',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              ref.read(routerProvider).push(Routes.settings);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              ref.read(analyticsProvider).logEvent(const AnalyticsEvent.logout());
            },
          ),
        ],
      ),
    );
  }
}
