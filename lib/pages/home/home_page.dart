import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshop/analytics/analytics.dart';
import 'package:quickshop/pages/home/lists_view.dart';
import 'package:quickshop/pages/home/recipes_view.dart';
import 'package:quickshop/router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late final TabController _tabController = TabController(
    initialIndex: _currentIndex,
    length: 2,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabTitles[_currentIndex]),
        automaticallyImplyLeading: false,
        actions: [
          Builder(builder: (ctx) {
            return IconButton(
              icon: const Icon(Icons.person),
              onPressed: () => Scaffold.of(ctx).openEndDrawer(),
            );
          }),
        ],
      ),
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
      body: TabBarView(controller: _tabController, children: const [
        ListsView(),
        RecipesView(),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded), label: 'Lists'),
          BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: 'Recipes'),
        ],
        onTap: (value) {
          setState(() {
            _tabController.animateTo(value);
            _currentIndex = value;
          });
        },
      ),
    );
  }

  final _tabTitles = const ['My Lists', 'My Recipes'];
}
