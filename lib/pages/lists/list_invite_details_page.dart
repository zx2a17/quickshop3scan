import 'package:flutter/material.dart';

class ListInviteDetailsPage extends StatelessWidget {
  const ListInviteDetailsPage({required this.inviteId, super.key});
  final String inviteId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Invite Details'),
      ),
      body: Center(
        child: Text('Invite ID: $inviteId'),
      ),
    );
  }
}
