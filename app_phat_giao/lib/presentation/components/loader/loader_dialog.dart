import 'package:app_phat_giao/presentation/components/loader/loader_widget.dart';
import 'package:flutter/material.dart';

class LoaderDialog extends StatelessWidget {
  const LoaderDialog({Key? key}) : super(key: key);

  static Future show(BuildContext context) async {
    return showDialog(context: context, builder: (_) => const LoaderDialog());
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return const LoaderWidget();
  }
}
