import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/core/hooks/request/get_client.dart';
import '/core/widget/async/request_handle.dart';
import '/feature/auth/data/remote/remote.dart';
import '/feature/auth/pages/Login/initial.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handleLogin = useRequestHandler(
      ref.watch(requestHandlerProvider),
      onError: (err) {
        showAdaptiveDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            content: Text("$err"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              )
            ],
          ),
        );
      },
    );

    return RequestHandleWidget(
      value: handleLogin.status,
      initial: SignInInitial(
        onSignIn: (data) {
          debugPrint(data.toString());
          handleLogin.trigger(
            '/v1/auth/login',
            method: 'POST',
            data: {
              'id': "88${data['id']}",
              'password': data['password'],
            },
            onSuccess: (data) {
              ref.read(authRepositoryProvider).saveUser(data);
              ref.invalidate(authRepositoryProvider);
            },
          );
        },
      ),
      success: (data) {
        return Center(
          child: Text('Success:$data'),
        );
      },
    );
  }
}
