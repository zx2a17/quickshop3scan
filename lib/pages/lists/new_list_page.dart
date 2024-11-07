import 'package:flutter/material.dart';

class NewListPage extends StatelessWidget {
  const NewListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New list'),
      ),
      body: const Center(
        child: Text('Create a new list'),
      ),
    );
  }
}
