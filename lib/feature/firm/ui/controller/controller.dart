import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/feature/firm/data/repository/repo.dart';
import '../../domain/models/firm_model.dart';

part 'controller.g.dart';

@Riverpod(keepAlive: true)
Future<List<FirmModel>> fetchAllFirm(FetchAllFirmRef ref) async {
  final repository = ref.watch(firmRepositoryProvider);
  final firms = await repository.fetchAllFirm();

  return firms;
}
