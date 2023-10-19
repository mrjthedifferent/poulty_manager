import 'package:flutter/material.dart';

import '/core/client/state/request_state.dart';
import '/core/widget/error_widget.dart';

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
          String err = e.message ?? "Something went wrong";
          if (e.response?.statusCode == 422) {
            if (e.response?.data
                case {
                  'message': String _,
                  'errors': Map details,
                  'success': false
                }) {
              for (var key in details.keys) {
                if (details[key] case List arr) {
                  err += "\n ${arr.join("\n")}";
                  continue;
                }
                err += details[key].toString();
              }
            }
          }

          return ErrorMessageWidget(
            errorMessage: err,
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
