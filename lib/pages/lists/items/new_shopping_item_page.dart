import 'package:flutter/material.dart';

class NewShoppingItemPage extends StatelessWidget {
  const NewShoppingItemPage({required this.listId, super.key});
  final String listId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Item'),
      ),
      body: const Center(
        child: Text('Create a new item here'),
      ),
    );
  }
}
