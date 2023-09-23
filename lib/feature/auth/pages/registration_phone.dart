import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/core/widget/async/request_handle.dart';
import '../../../core/hooks/request/get_client.dart';
import 'registation/registation_initial.dart';

class RegistrationPhonePage extends HookConsumerWidget {
  const RegistrationPhonePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sendOtp = useRequestHandler(ref.watch(requestHandlerProvider));

    return RequestHandleWidget(
      initial: () => RegistrationInitial(
        onRegistration: (phone) {
          sendOtp.trigger(
            '/v1/auth/register/otp',
            method: 'POST',
            data: {
              'phone': phone,
            },
            onSuccess: (data) {
              context.push(
                Uri(
                  path: '/auth/otp',
                  queryParameters: {
                    'phone': phone,
                    'otp': data['otp'],
                  },
                ).toString(),
              );

              debugPrint(Uri(
                path: '/auth/otp',
                queryParameters: {
                  'phone': phone,
                  'otp': data['otp'],
                },
              ).toString());
            },
          );
        },
      ),
      value: sendOtp.status,
      success: (data) {
        return Center(
          child: Text('Success:$data'),
        );
      },
    );
  }
}
