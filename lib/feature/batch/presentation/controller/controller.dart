import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/client/api_url.dart';
import '/core/client/request_client.dart';
import '/feature/shared/model/Form/form.dart';

part 'controller.g.dart';

@riverpod
Future<FormSettings> fetchFormSettings(FetchFormSettingsRef ref) async {
  final client = ref.watch(requestClientProvider).client;

  return client
      .get<Map<String, dynamic>>(ApiEndpoints.poultryBatchSettings)
      .then((value) => FormSettings.fromJson(value.data!));
}
