import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/list_summary.dart';
import '../models/user.dart';
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
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return _fromFirestore(data, doc.id);
      }).toList();
    });
  }

  User _parseUser(dynamic data) {
    return User(
      id: data['id'],
      name: data['name'],
      email: data['email'],
    );
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
    final listDoc = await fs.collection('lists').add(_toFirestore(list));
    return listDoc.id;
  }

  ListSummary _fromFirestore(Map<String, dynamic> data, String listId) {
    return ListSummary(
      id: listId,
      name: data['name'],
      ownerId: data['ownerId'],
      editorIds: List<String>.from(data['editorIds']),
      editors: List<User>.from(data['editors'].map(_parseUser)),
      itemCount: data['itemCount'],
      lastModified: Map<String, int>.from(data['lastModified']),
      listType: parseListType(data['listType']),
    );
  }

  Map<String, dynamic> _toFirestore(ListSummary list) {
    return {
      'name': list.name,
      'ownerId': list.ownerId,
      'editorIds': list.editorIds,
      'editors': list.editors
          .map((e) => {
                'id': e.id,
                'name': e.name,
                'email': e.email,
              })
          .toList(),
      'itemCount': list.itemCount,
      'lastModified': list.lastModified,
      'listType': list.listType.name,
    };
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
