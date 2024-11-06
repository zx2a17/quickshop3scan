import 'package:flutter/material.dart';

class RecipesView extends StatelessWidget {
  const RecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My recipes'),
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
