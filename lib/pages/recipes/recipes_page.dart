import 'package:flutter/material.dart';

import '../home/profile_icon.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My recipes'),
        leading: const ProfileIcon(),
      ),
      body: const Column(
        children: [
          RecipeSummaryTile(recipeId: '1'),
          RecipeSummaryTile(recipeId: '2'),
          RecipeSummaryTile(recipeId: '3'),
        ],
      ),
    );
  }
}

class RecipeSummaryTile extends StatelessWidget {
  const RecipeSummaryTile({required this.recipeId, super.key});
  final String recipeId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Recipe $recipeId'),
    );
  }
}
