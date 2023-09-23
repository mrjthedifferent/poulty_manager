import 'package:flutter/material.dart';

import '/core/client/state/request_state.dart';
import '../error_widget.dart';

class RequestHandleWidget<T> extends StatelessWidget {
  const RequestHandleWidget(
      {super.key,
      required this.value,
      required this.success,
      required this.initial});
  final RequestStatus<T> value;
  final Widget Function(T) success;
  final Widget Function() initial;

  @override
  Widget build(BuildContext context) {
    return value.when(
      initial: initial,
      success: (data) => success(data),
      error: (e) => Center(child: ErrorMessageWidget(e)),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
