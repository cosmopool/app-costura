import 'package:flutter/material.dart';

confirmationDialog(BuildContext context, Function onConfirm, Function onCancel, String title, String message) {
  Widget cancelButton = TextButton(
    child: const Text("Não"),
    onPressed: () => onCancel(),
  );

  Widget deleteButton = TextButton(
    onPressed: () => onConfirm(),
    child: const Text("Sim"),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        cancelButton,
        deleteButton,
      ],
    ),
  );
}
