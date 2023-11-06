import 'package:flutter/material.dart';
import 'package:poulty_manager/core/utils/request_state.dart';

import '/core/widget/error_widget.dart';

class MutationHandler<T> extends StatelessWidget {
  const MutationHandler(
      {super.key,
      required this.value,
      required this.success,
      required this.initial});
  final RequestNetworkState<T> value;
  final Widget Function(T) success;
  final Widget Function() initial;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: switch (value) {
      RequestNetworkInitial() => initial(),
      RequestNetworkLoading() => const Center(
          child: CircularProgressIndicator(),
        ),
      RequestNetworkData(:final value) => success(value as T),
      RequestNetworkError() => ErrorMessageWidget(
          errorMessage: "Something went wrong", resetWidget: initial),
    });
  }
}
