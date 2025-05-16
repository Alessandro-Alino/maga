import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.title,
    required this.content,
    this.onConfirm,
  });

  final String title;
  final Widget content;
  final void Function()? onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content,
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        // Go Back
        ElevatedButton(
          onPressed: () {
            context.router.pop();
          },
          child: const Text('No'),
        ),
        // Confirm
        ElevatedButton(onPressed: onConfirm, child: const Text('Si')),
      ],
    );
  }
}
