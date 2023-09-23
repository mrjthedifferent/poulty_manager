import 'package:flutter/material.dart';
import 'package:poulty_manager/core/widget/error_widget.dart';

import '/core/client/state/request_state.dart';

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
    return Scaffold(
      body: value.when(
        initial: initial,
        success: (data) => success(data),
        // when error occurs show an alert dialog with the error message and show the initial widget
        error: (e) {
          // show toast snackbar

          return ErrorMessageWidget(
            errorMessage: e,
            resetWidget: initial,
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
