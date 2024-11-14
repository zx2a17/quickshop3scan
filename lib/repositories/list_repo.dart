import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/list_summary.dart';
import '../services/firestore.dart';
import 'user_repo.dart';

part 'list_repo.g.dart';

@riverpod
class ListRepo extends _$ListRepo {
  @override
  Stream<List<ListSummary>> build() {
    final fs = ref.watch(firestoreProvider);
    final user = ref.watch(userRepoProvider);
    if (user == null) {
      return const Stream.empty();
    }
    return fs
        .collection('lists')
        .where('editorIds', arrayContains: user.id)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map(ListSummary.fromFirestore).toList();
    });
  }

  /// Creates a new list and returns the list id
  Future<String> createList(String name, ListType listType) async {
    final user = ref.watch(userRepoProvider);
    if (user == null) {
      throw Exception('User not signed in');
    }
    final fs = ref.read(firestoreProvider);
    final list = ListSummary(
      id: '',
      name: name,
      ownerId: user.id,
      editorIds: [user.id],
      editors: [user],
      itemCount: 0,
      lastModified: {user.id: DateTime.now().millisecondsSinceEpoch},
      listType: listType,
    );
    final listDoc = await fs.collection('lists').add(list.toFirestore());
    return listDoc.id;
  }
}

@riverpod
AsyncValue<ListSummary?> list(Ref ref, String listId) {
  final result = ref.watch(listRepoProvider);
  return result.when(
    data: (lists) => AsyncValue.data(
      lists.any((list) => list.id == listId) ? lists.firstWhere((list) => list.id == listId) : null,
    ),
    error: (error, trace) => AsyncValue.error(error, trace),
    loading: AsyncValue.loading,
  );
}
