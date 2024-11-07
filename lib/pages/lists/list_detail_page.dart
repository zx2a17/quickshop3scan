import 'package:flutter/material.dart';

class ListDetailPage extends StatelessWidget {
  const ListDetailPage({required this.listId, super.key});

  final String listId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List $listId'),
      ),
      body: Center(
        child: Text('Contents of list $listId'),
      ),
    );
  }
}
