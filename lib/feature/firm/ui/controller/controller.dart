import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/client/api_url.dart';
import '/core/client/request_client.dart';
import '/feature/firm/data/repository/repo.dart';
import '../../../batch/domain/domain.dart';
import '../../domain/models/firm_model.dart';

part 'controller.g.dart';

@riverpod
Future<List<FirmModel>> fetchAllFirm(FetchAllFirmRef ref) async {
  final repository = ref.watch(firmRepositoryProvider);
  final firms = await repository.fetchAllFirm();
  return firms;
}

@riverpod
Future<List<ModelBatch>> fetchAllBatchByFirm(
    FetchAllBatchByFirmRef ref, String firmId) async {
  final client = ref.watch(requestClientProvider).client;
  final result = await client
      .get<List<dynamic>>(ApiEndpoints.poultryBatches, queryParameters: {
    "firm_id": firmId,
  }).then(
    (value) => value.data!.map((e) => ModelBatch.fromJson(e)).toList(),
  );

  return result;
}

@riverpod
Future<ModelBatchDetails> fetchBatchById(
    FetchBatchByIdRef ref, String batchId) async {
  final client = ref.watch(requestClientProvider).client;
  final result = await client
      .get<Map<String, dynamic>>("${ApiEndpoints.poultryBatches}/$batchId")
      .then((value) => ModelBatchDetails.fromJson(value.data!));

  return result;
}
