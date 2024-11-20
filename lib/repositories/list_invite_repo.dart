import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/list_invite.dart';
import '../services/firestore.dart';

part 'list_invite_repo.g.dart';

@riverpod
Stream<ListInvite?> listInviteRepo(Ref ref, String inviteId) {
  final fs = ref.read(firestoreProvider);
  return fs.collection('invites').doc(inviteId).snapshots().map((snapshot) {
    if (!snapshot.exists) {
      return null;
    }
    return ListInvite.fromFirestore(snapshot);
  });
}
