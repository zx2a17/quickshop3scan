import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../analytics/crash_reporter.dart';
import '../../models/list_summary.dart';
import '../../repositories/list_repo.dart';
import '../../router.dart';
import '../home/profile_icon.dart';

class ListsPage extends ConsumerWidget {
  const ListsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My lists'),
        leading: const ProfileIcon(),
      ),
      body: Builder(builder: (context) {
        final listsValue = ref.watch(listRepoProvider);
        if (listsValue.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (listsValue.hasError) {
          ref.read(crashReporterProvider).report(listsValue.error!, StackTrace.current);
          return const Center(
            child: Text('Failed to load lists'),
          );
        }
        final lists = listsValue.requireValue;
        return ListView.builder(
          itemCount: lists.length,
          itemBuilder: (context, index) {
            final listSummary = lists[index];
            return ListSummaryTile(listSummary: listSummary);
          },
        );
      }),
      floatingActionButton: Consumer(builder: (context, ref, _) {
        return FloatingActionButton(
          onPressed: () => ref.read(routerProvider).push(Routes.newList),
          child: const Icon(Icons.add),
        );
      }),
    );
  }
}

class ListSummaryTile extends StatelessWidget {
  const ListSummaryTile({required this.listSummary, super.key});
  final ListSummary listSummary;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return ListTile(
        title: Text(listSummary.name),
        onTap: () => ref.read(routerProvider).push(Routes.listDetail(listSummary.id)),
      );
    });
  }
}
