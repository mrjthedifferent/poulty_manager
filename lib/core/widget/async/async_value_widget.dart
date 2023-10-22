import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/core/widget/error_widget.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({super.key, required this.value, required this.data});
  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, st) {
        String err = "Something went wrong";
        if (e is DioException) {
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
        }

        return Center(
          child: ErrorMessageWidget(
            errorMessage: err,
            resetWidget: () => const SizedBox(),
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
