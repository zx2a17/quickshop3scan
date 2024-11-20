import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../analytics/crash_reporter.dart';
import '../../models/list_invite.dart';
import '../../models/list_summary.dart';
import '../../repositories/list_repo.dart';
import '../../router.dart';
import 'list_invite_state.dart';

class ListInviteDetailsPage extends ConsumerWidget {
  const ListInviteDetailsPage({super.key, required this.inviteId});
  final String inviteId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(listInviteStateProvider(inviteId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('List invitation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: () => const Center(
            child: Text(
              'Invitation could not be loaded. Please check your network connection.',
              textAlign: TextAlign.center,
            ),
          ),
          notFound: () =>
              const Center(child: Text('Invitation not found. It may have been deleted.')),
          isOwner: (invite) => _IsOwnerView(invite: invite),
          pending: (invite) => _PendingInvitationView(invite: invite),
          accepted: (invite) => _InvitationAcceptedView(invite: invite),
        ),
      ),
    );
  }
}

class _InvitationAcceptedView extends ConsumerWidget {
  const _InvitationAcceptedView({required this.invite});
  final ListInvite invite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              text: 'Invitation accepted for ${invite.listType.displayName} ',
              children: [
                TextSpan(
                  text: invite.listName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              ref.read(routerProvider).replace(Routes.listDetail(invite.listId));
            },
            child: const Text('Open list'),
          ),
        ],
      ),
    );
  }
}

class _IsOwnerView extends StatelessWidget {
  const _IsOwnerView({required this.invite});
  final ListInvite invite;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              text:
                  'This is your personal invite link for sharing the ${invite.listType.displayName} ',
              children: <TextSpan>[
                TextSpan(
                  text: invite.listName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          SelectableText(
            invite.url,
            textAlign: TextAlign.center,
            style: const TextStyle(decoration: TextDecoration.underline),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _copyToClipboard(context, invite.url),
                  child: const Row(
                    children: [
                      Icon(Icons.copy),
                      SizedBox(width: 12),
                      Text('Copy'),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _shareLink(invite),
                  child: const Row(
                    children: [
                      Icon(Icons.share),
                      SizedBox(width: 12),
                      Text('Share'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  void _shareLink(ListInvite invite) {
    Share.share("I'd like to share this Quickshop shopping list with you: ${invite.url}");
  }
}

class _PendingInvitationView extends ConsumerStatefulWidget {
  const _PendingInvitationView({required this.invite});
  final ListInvite invite;

  @override
  ConsumerState<_PendingInvitationView> createState() => _PendingInvitationViewState();
}

class _PendingInvitationViewState extends ConsumerState<_PendingInvitationView> {
  bool _acceptInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: widget.invite.inviterName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' has invited you to share their ${widget.invite.listType.displayName} ',
                ),
                TextSpan(
                  text: widget.invite.listName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    ref.read(routerProvider).pop();
                  },
                  child: const Text('Ignore'),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: ElevatedButton(
                  onPressed: _acceptInProgress ? null : _acceptListInvitation,
                  child: _acceptInProgress
                      ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator())
                      : const Text('Accept'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _acceptListInvitation() async {
    try {
      setState(() => _acceptInProgress = true);
      final result = await ref.read(listRepoProvider.notifier).acceptListInvite(widget.invite.id);
      if (mounted) {
        if (result == AcceptInviteResult.retryableError) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Failed to accept invitation. Please check your network connection and try again later.'),
          ));
        } else if (result == AcceptInviteResult.unknownError) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('An unexpected error occured while accepting the invitation.'),
          ));
        }
      }
    } catch (e, t) {
      ref.read(crashReporterProvider).report(e, t);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('An unexpected error occured while accepting the invitation.'),
        ));
      }
    } finally {
      setState(() => _acceptInProgress = false);
    }
  }
}
