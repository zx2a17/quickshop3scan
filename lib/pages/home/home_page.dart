import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_drawer.dart';

final homePageScaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'Home');

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
      key: homePageScaffoldKey,
      body: widget.navigationShell,
      drawer: const HomeDrawer(),
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
