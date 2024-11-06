import 'package:flutter/material.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My favourites'),
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
