import 'package:poulty_manager/core/client/api_url.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/client/request_client.dart';
import '../../domain/domain.dart';

part 'controller.g.dart';

@riverpod
Future<List<DoctorVisitModel>> fetchAllDoctorVisit(
    FetchAllDoctorVisitRef ref, String batchId) async {
  final client = ref.watch(requestClientProvider).client;

  return client
      .getUri<List<dynamic>>(
        Uri(
          path: ApiEndpoints.poultryBatchDoctorVisit,
          queryParameters: {
            "poultry_batch_id": batchId,
          },
        ),
      )
      .then((value) =>
          value.data!.map((e) => DoctorVisitModel.fromJson(e)).toList());
}
