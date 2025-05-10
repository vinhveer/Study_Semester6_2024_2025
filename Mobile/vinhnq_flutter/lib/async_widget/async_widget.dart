import 'package:flutter/material.dart';

class AsyncWidget extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final Widget Function()? loading;
  final Widget Function()? error;
  final String? errorMessage;
  final Widget Function(BuildContext context, AsyncSnapshot snapshot) builder;

  const AsyncWidget({
    required this.snapshot,
    this.loading,
    this.error,
    this.errorMessage,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (snapshot.hasError) {
      return error == null
          ? Center(child: Text(errorMessage ?? "Có lỗi xảy ra"))
          : error!();
    }

    if (!snapshot.hasData) {
      return loading == null
          ? const Center(child: CircularProgressIndicator())
          : loading!();
    }

    return builder(context, snapshot);
  }
}