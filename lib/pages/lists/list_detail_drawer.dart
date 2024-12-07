import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/list_repo.dart';
import '../../router.dart';

class ListDetailDrawer extends ConsumerStatefulWidget {
  const ListDetailDrawer({required this.listId, super.key});
  final String listId;

  @override
  ConsumerState<ListDetailDrawer> createState() => _ListDetailDrawerState();
}

class _ListDetailDrawerState extends ConsumerState<ListDetailDrawer> {
  @override
  Widget build(BuildContext context) {
    final list = ref.watch(listProvider(widget.listId)).valueOrNull;
    final listName = list?.name ?? 'List name';
    final itemCount = list?.itemCount ?? 0;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    listName,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('$itemCount item${itemCount == 1 ? '' : 's'}'),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Share list'),
            onTap: () {
              ref.read(routerProvider).push(Routes.shareList(widget.listId));
            },
          ),
          const Divider(
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            leading: const Icon(Icons.check_box_outlined),
            title: const Text('Remove checked items'),
            onTap: () {
              throw UnimplementedError();
            },
          ),
          const Divider(
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Rename list'),
            onTap: () {
              throw UnimplementedError();
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete list'),
            onTap: () {
              throw UnimplementedError();
            },
          ),
        ],
      ),
    );
  }
}
