import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({required this.recipeId, super.key});

  final String recipeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe $recipeId'),
      ),
      body: Center(
        child: Text('Contents of recipe $recipeId'),
      ),
    );
  }
}
