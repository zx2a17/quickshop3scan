import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../analytics/crash_reporter.dart';
import '../../models/list_invite.dart';
import '../../repositories/list_invite_repo.dart';
import '../../repositories/list_repo.dart';
import '../../repositories/user_repo.dart';

part 'list_invite_state.freezed.dart';
part 'list_invite_state.g.dart';

@freezed
class ListInviteState with _$ListInviteState {
  const ListInviteState._();

  const factory ListInviteState.loading() = _Loading;
  const factory ListInviteState.error() = _Error;
  const factory ListInviteState.notFound() = _NotFound;
  const factory ListInviteState.isOwner(ListInvite invite) = _IsOwner;
  const factory ListInviteState.pending(ListInvite invite) = _Pending;
  const factory ListInviteState.accepted(ListInvite invite) = _Accepted;
}

@riverpod
ListInviteState listInviteState(Ref ref, String inviteId) {
  final inviteAsyncValue = ref.watch(listInviteRepoProvider(inviteId));
  final listsAsyncValue = ref.watch(listRepoProvider);
  final user = ref.watch(userRepoProvider);

  if (inviteAsyncValue.isLoading || listsAsyncValue.isLoading) {
    return const ListInviteState.loading();
  }

  if (inviteAsyncValue.hasError || listsAsyncValue.hasError) {
    if (inviteAsyncValue.hasError) {
      ref.read(crashReporterProvider).reportAsyncError(inviteAsyncValue);
    }
    if (listsAsyncValue.hasError) {
      ref.read(crashReporterProvider).reportAsyncError(listsAsyncValue);
    }
    return const ListInviteState.error();
  }

  final invite = inviteAsyncValue.requireValue;
  final lists = listsAsyncValue.requireValue;
  if (invite == null) {
    return const ListInviteState.notFound();
  }

  if (invite.inviterId == user?.id) {
    return ListInviteState.isOwner(invite);
  }

  if (lists.any((list) => list.id == invite.listId)) {
    return ListInviteState.accepted(invite);
  }
  return ListInviteState.pending(invite);
}
