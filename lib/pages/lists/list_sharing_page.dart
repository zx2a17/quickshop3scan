import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../analytics/crash_reporter.dart';
import '../../models/list_invite.dart';
import '../../models/list_summary.dart';
import '../../repositories/list_repo.dart';
import '../../repositories/list_sharing_repo.dart';

class ListSharingPage extends ConsumerStatefulWidget {
  const ListSharingPage({super.key, required this.listId});
  final String listId;

  @override
  ConsumerState<ListSharingPage> createState() => _ListSharingPageState();
}

class _ListSharingPageState extends ConsumerState<ListSharingPage> {
  bool linkCreationInProgress = false;

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(listProvider(widget.listId));
    final invite = ref.watch(listSharingRepoProvider(widget.listId));
    return Scaffold(
      appBar: AppBar(
        title: Text('Share ${list.valueOrNull?.name ?? ''}'),
      ),
      body: list.when(
        error: (error, trace) {
          ref.read(crashReporterProvider).report(error, trace);
          return const Center(child: Text('Failed to load list'));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (list) {
          if (list == null) {
            return Center(child: Text('List ${widget.listId} not found'));
          }

          return invite.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, trace) {
              ref.read(crashReporterProvider).report(error, trace);
              return const Center(child: Text('Failed to load sharing link'));
            },
            data: (invite) {
              if (invite == null || linkCreationInProgress) {
                return Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Want to share this list?',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed:
                            linkCreationInProgress ? null : () => _createSharingLinkForList(list),
                        child: linkCreationInProgress
                            ? const SizedBox(
                                height: 12,
                                width: 12,
                                child: CircularProgressIndicator(),
                              )
                            : const Text('Create sharing link'),
                      ),
                    ],
                  ),
                );
              }
              return SharingLinkTile(invite: invite);
            },
          );
        },
      ),
    );
  }

  void _createSharingLinkForList(ListSummary list) async {
    setState(() => linkCreationInProgress = true);
    try {
      await ref
          .read(listSharingRepoProvider(widget.listId).notifier)
          .createSharingLinkForList(list);
    } catch (e, stackTrace) {
      ref.read(crashReporterProvider).report(e, stackTrace);
    } finally {
      setState(() => linkCreationInProgress = false);
    }
  }
}

class SharingLinkTile extends StatelessWidget {
  const SharingLinkTile({required this.invite, super.key});
  final ListInvite invite;

  @override
  Widget build(BuildContext context) {
    return Text('Sharing link: ${invite.id}');
  }
}
