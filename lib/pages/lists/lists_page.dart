import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshop/pages/home/profile_icon.dart';
import 'package:quickshop/router.dart';

class ListsPage extends StatelessWidget {
  const ListsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My lists'),
        leading: const ProfileIcon(),
      ),
      body: const Column(
        children: [
          ListSummaryTile(listId: '1'),
          ListSummaryTile(listId: '2'),
          ListSummaryTile(listId: '3'),
        ],
      ),
      floatingActionButton: Consumer(builder: (context, ref, _) {
        return FloatingActionButton(
          onPressed: () => ref.read(routerProvider).push(Routes.newList),
          child: const Icon(Icons.add),
        );
      }),
    );
  }
}

class ListSummaryTile extends StatelessWidget {
  const ListSummaryTile({required this.listId, super.key});
  final String listId;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return ListTile(
        title: Text('List $listId'),
        onTap: () => ref.read(routerProvider).push(Routes.listDetail(listId)),
      );
    });
  }
}
