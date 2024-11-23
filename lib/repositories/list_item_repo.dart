import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/shopping_item.dart';
import '../services/firestore.dart';
import 'delay_provider_dispose.dart';
import 'user_repo.dart';

part 'list_item_repo.g.dart';

@riverpod
class ShoppingListItemRepo extends _$ShoppingListItemRepo {
  @override
  Stream<List<ShoppingItem>> build(String listId) {
    ref.delayDispose(const Duration(minutes: 15));
    final fs = ref.watch(firestoreProvider);
    return fs.collection('lists/$listId/items').snapshots().map((snapshot) {
      return snapshot.docs.map(ShoppingItem.fromFirestore).toList();
    });
  }

  Future<void> addItem({
    required String listId,
    required String itemName,
    required List<String> categories,
  }) async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    final item = ShoppingItem(
      path: '',
      name: itemName,
      categories: categories,
      addedByUserId: user!.id,
      completed: false,
    );
    await fs.collection('lists/$listId/items').add(item.toFirestore());
  }

  Future<void> toggleItem(ShoppingItem item) async {
    final fs = ref.read(firestoreProvider);
    await fs.doc(item.path).update({
      ShoppingItem.fieldKeys.completed: !item.completed,
    });
  }
}
