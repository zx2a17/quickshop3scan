import 'package:flutter/material.dart';
import 'package:quickshop/pages/home/profile_icon.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My favourites'),
        leading: const ProfileIcon(),
      ),
      body: const Column(
        children: [
          FavouriteSummaryTile(favouriteId: '1'),
          FavouriteSummaryTile(favouriteId: '2'),
          FavouriteSummaryTile(favouriteId: '3'),
        ],
      ),
    );
  }
}

class FavouriteSummaryTile extends StatelessWidget {
  const FavouriteSummaryTile({required this.favouriteId, super.key});
  final String favouriteId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Favourite $favouriteId'),
    );
  }
}
