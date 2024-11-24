import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../analytics/crash_reporter.dart';
import '../../models/list_summary.dart';
import '../../models/shopping_item.dart';
import '../../repositories/list_item_repo.dart';
import '../../repositories/list_repo.dart';
import '../../router.dart';

class ListDetailPage extends ConsumerWidget {
  const ListDetailPage({required this.listId, super.key});

  final String listId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(listProvider(listId));
    return Scaffold(
      appBar: AppBar(
        title: Text(list.valueOrNull?.name ?? 'Shopping list'),
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
      body: list.when(
        data: (list) {
          if (list == null) {
            return const Center(child: Text('List not found'));
          }
          return switch (list.listType) {
            ListType.shoppingList => ShoppingListContentsView(list: list),
            ListType.checklist => ChecklistItemsView(list: list),
          };
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) {
          return const Center(
            child: Text('Failed to load list'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add item'),
        icon: const Icon(Icons.add),
        onPressed: () {
          final listValue = list.valueOrNull;
          if (listValue == null) {
            return;
          }
          switch (listValue.listType) {
            case ListType.shoppingList:
              ref.read(routerProvider).go(Routes.newShoppingListItem(listId));
              break;
            case ListType.checklist:
              ref.read(routerProvider).go(Routes.newChecklistItem(listId));
              break;
          }
        },
      ),
    );
  }
}

@visibleForTesting
class ShoppingListContentsView extends ConsumerWidget {
  const ShoppingListContentsView({required this.list, super.key});
  final ListSummary list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsyncValue = ref.watch(shoppingListItemRepoProvider(list.id));
    if (itemsAsyncValue.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (itemsAsyncValue.hasError) {
      ref.read(crashReporterProvider).reportAsyncError(itemsAsyncValue);
      return const Center(
        child: Text('Failed to load list items'),
      );
    }
    final items = itemsAsyncValue.requireValue;
    if (items.isEmpty) {
      return const ShoppingListEmptyView();
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => ShoppingItemTile(list: list, item: items[index]),
    );
  }
}

@visibleForTesting
class ShoppingItemTile extends ConsumerWidget {
  const ShoppingItemTile({required this.list, required this.item, super.key});
  final ListSummary list;
  final ShoppingItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () => ref.read(shoppingListItemRepoProvider(list.id).notifier).toggleItem(item),
      title: Text(
        item.name,
        style: TextStyle(decoration: item.completed ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: item.completed,
        onChanged: (value) {
          ref.read(shoppingListItemRepoProvider(list.id).notifier).toggleItem(item);
        },
      ),
    );
  }
}

@visibleForTesting
class ShoppingListEmptyView extends StatelessWidget {
  const ShoppingListEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No items in list'),
    );
  }
}

class ChecklistItemsView extends StatelessWidget {
  const ChecklistItemsView({required this.list, super.key});
  final ListSummary list;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
