import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/feature/shared/model/Form/form.dart';
import '../../../../core/client/request_client.dart';

part 'controller.g.dart';

@riverpod
Future<FormSettings> batchInfoUpdate(BatchInfoUpdateRef ref, String url) async {
  final client = ref.watch(requestClientProvider).client;

  return client
      .get<Map<String, dynamic>>(url)
      .then((value) => FormSettings.fromJson(value.data!));
}
