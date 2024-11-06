import 'package:flutter/material.dart';

class ListsView extends StatelessWidget {
  const ListsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My lists'),
      ),
      body: const Column(
        children: [
          ListSummaryTile(listId: '1'),
          ListSummaryTile(listId: '2'),
          ListSummaryTile(listId: '3'),
        ],
      ),
    );
  }
}

class ListSummaryTile extends StatelessWidget {
  const ListSummaryTile({required this.listId, super.key});
  final String listId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('List $listId'),
    );
  }
}
