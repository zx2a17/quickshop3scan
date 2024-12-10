import 'package:flutter/material.dart';

/// Intended for use as the child of a button while it is in a loading state
class ButtonProgressIndicator extends StatelessWidget {
  const ButtonProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 12,
      width: 12,
      child: CircularProgressIndicator(),
    );
  }
}
