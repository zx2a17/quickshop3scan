import 'package:flutter/material.dart';

class NewRecipePage extends StatelessWidget {
  const NewRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New recipe'),
      ),
      body: const Center(
        child: Text('Create a new recipe'),
      ),
    );
  }
}
