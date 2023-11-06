import 'package:flutter/material.dart';
import 'package:poulty_manager/core/utils/request_state.dart';

class RequestHandleWidget<T> extends StatelessWidget {
  const RequestHandleWidget(
      {super.key,
      required this.value,
      required this.success,
      required this.initial});
  final RequestNetworkState<T> value;
  final Widget Function(T) success;
  final Widget initial;

  @override
  Widget build(BuildContext context) {
    // value.maybeMap(
    //     error: (err) => showAdaptiveDialog(
    //           context: context,
    //           builder: (ctx) => const AlertDialog.adaptive(
    //             content: Text("Some Error Occur"),
    //           ),
    //         ),
    //     orElse: () {});

    // value.mapOrNull(
    //   error: (value) => showDialog(
    //     context: context,
    //     builder: (ctx) => AlertDialog(
    //       content: const Text("je"),
    //       actions: [
    //         const Text("Ok").gestures(onTap: () {
    //           Navigator.pop(context);
    //         })
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
      body: switch (value) {
        RequestNetworkLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        RequestNetworkData(:final value) => success(value as T),
        _ => initial
      },
      // body: value.maybeWhen(
      //   initial: initial,
      //   success: (data) => success(data),
      //   orElse: () => Container(),
      //   // when error occurs show an alert dialog with the error message and show the initial widget
      //   error: (e) {
      //     // show toast snackbar
      //     String err = e.message ?? "Something went wrong";
      //     if (e.response?.statusCode == 422) {
      //       if (e.response?.data
      //           case {
      //             'message': String _,
      //             'errors': Map details,
      //             'success': false
      //           }) {
      //         for (var key in details.keys) {
      //           if (details[key] case List arr) {
      //             err += "\n ${arr.join("\n")}";
      //             continue;
      //           }
      //           err += details[key].toString();
      //         }
      //       }
      //     }

      //     return ErrorMessageWidget(
      //       errorMessage: err,
      //       resetWidget: initial,
      //     );
      //   },
      //   loading: () => const Center(
      //     child: CircularProgressIndicator(),
      //   ),
      // ),
    );
  }
}
