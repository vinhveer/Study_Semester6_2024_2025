import 'package:flutter/material.dart';

Future<String?> showConfirmDialog(
    BuildContext context,
    String dispMessage,
    {String? title = "Xác nhận"}
) async {
  AlertDialog dialog = AlertDialog(
    title: Text(title!),
    content: Text(dispMessage),
    actions: [
      ElevatedButton(
          onPressed: () => Navigator.of(context, rootNavigator: true).pop("cancel"),
          child: const Text("Hủy")
      ),
      ElevatedButton(
          onPressed: () => Navigator.of(context, rootNavigator: true).pop("ok"),
          child: const Text("OK")
      )
    ],
  );

  String? res = await showDialog<String?>(
      barrierDismissible: false,
      context: context,
      builder: (context) => dialog,
  );

  return res;
}

void showSnackBar(BuildContext context, {required String message, int seconds = 3}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: seconds),)
  );
}