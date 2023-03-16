// ignore: file_names
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: non_constant_identifier_names
Future<void> CustomDialogueBoxError(
    BuildContext ctx, String title, String desc) async {
  showDialog(
      context: ctx,
      builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(desc),
            actions: [
              TextButton(
                  onPressed: () => context.pop(), child: const Text("Ok")),
            ],
          ));
}
