// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ErrorMessageWidget extends HookWidget {
  final String errorMessage;
  final Widget Function() resetWidget;
  const ErrorMessageWidget({
    super.key,
    required this.errorMessage,
    required this.resetWidget,
  });
  @override
  Widget build(BuildContext context) {
    final showError = useState(true);
    return showError.value
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Text(errorMessage),
              ElevatedButton(
                  onPressed: () {
                    showError.value = !showError.value;
                  },
                  child: const Text("Ok")),
              const Spacer()
            ],
          )
        : resetWidget();
  }
}
