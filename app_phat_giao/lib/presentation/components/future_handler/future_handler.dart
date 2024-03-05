import 'package:flutter/material.dart';

import '../loader/loader_widget.dart';

class FutureRender<T> extends StatelessWidget {
  const FutureRender(
      {Key? key,
      required this.future,
      required this.errorWidget,
      required this.resultWidget,
      this.loadingWidget})
      : super(key: key);

  final Future<T> future;
  final Widget Function(Object?) errorWidget;
  final Widget Function(T) resultWidget;
  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future, // a previously-obtained Future<String> or null
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return loadingWidget ?? const LoaderWidget();
        }

        if (snapshot.hasData && snapshot.data != null) {
          return resultWidget(snapshot.data as T);
        }
        if (snapshot.hasError) {
          return errorWidget(snapshot.error);
        }
        return loadingWidget ?? const LoaderWidget();
      },
    );
  }
}
