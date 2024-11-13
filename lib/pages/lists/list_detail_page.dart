import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/list_repo.dart';
import '../../router.dart';

class ListDetailPage extends ConsumerWidget {
  const ListDetailPage({required this.listId, super.key});

  final String listId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(listProvider(listId));
    print(listId);
    return Scaffold(
      appBar: AppBar(
        title: Text('List ${list.valueOrNull?.name ?? ''}'),
        actions: [
          MenuAnchor(
            builder: (BuildContext context, MenuController controller, Widget? child) {
              return IconButton(
                icon: const Icon(Icons.more_vert),
                tooltip: 'Show menu',
                onPressed: () => controller.isOpen ? controller.close() : controller.open(),
              );
            },
            menuChildren: [
              MenuItemButton(
                onPressed: () {
                  ref.read(routerProvider).push(Routes.shareList(listId));
                },
                leadingIcon: const Icon(Icons.people),
                child: const Text('Share list'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Text('Contents of list $listId'),
      ),
    );
  }
}
