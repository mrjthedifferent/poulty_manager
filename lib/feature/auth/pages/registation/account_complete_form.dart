// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poulty_manager/feature/auth/data/remote/remote.dart';

import '/core/hooks/request/get_client.dart';
import '/core/widget/async/request_handle.dart';
import '/feature/auth/pages/account_complete.dart';

class AccountCompleteForm extends HookConsumerWidget {
  final String phone;
  final String otp;
  const AccountCompleteForm({Key? key, required this.phone, required this.otp})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountCompleteFormAction = useRequestHandler(
      ref.watch(requestHandlerProvider),
    );

    return RequestHandleWidget(
      initial: () => AccountCompletePage(
        onRegister: (data) {
          accountCompleteFormAction.trigger(
            '/v1/auth/register',
            method: 'POST',
            data: {
              'phone': phone,
              'otp': otp,
              ...data,
            },
            onSuccess: (data) {
              debugPrint('Success:$data');
              ref.read(authRepositoryProvider).saveUser(data);
              ref.invalidate(authRepositoryProvider);
              // ref.read(authRepositoryProvider).saveUser(data);
            },
          );
        },
      ),
      value: accountCompleteFormAction.status,
      success: (data) {
        return const Center(
          child: Text('Success:data'),
        );
      },
    );
  }
}
