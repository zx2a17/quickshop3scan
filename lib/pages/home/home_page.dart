import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quickshop/analytics/analytics.dart';
import 'package:quickshop/router.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      endDrawer: Drawer(
        child: Consumer(builder: (context, ref, _) {
          return Column(
            children: [
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
          );
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.navigationShell.currentIndex,
        onTap: (index) => widget.navigationShell.goBranch(index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded), label: 'Lists'),
          BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: 'Recipes'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
