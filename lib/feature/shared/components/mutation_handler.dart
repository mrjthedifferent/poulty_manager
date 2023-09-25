import 'package:flutter/material.dart';

import '/core/client/state/request_state.dart';
import '/core/widget/error_widget.dart';

class MutationHandler<T> extends StatelessWidget {
  const MutationHandler(
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
      error: (e) {
        return ErrorMessageWidget(
          errorMessage: e,
          resetWidget: initial,
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
