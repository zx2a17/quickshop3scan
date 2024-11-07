import 'package:flutter/material.dart';

import 'home_page.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.account_circle),
      onPressed: () => homePageScaffoldKey.currentState!.openDrawer(),
    );
  }
}
