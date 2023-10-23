import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/config/config.dart';
import '/core/client/request_client.dart';
import '/feature/auth/data/local/local_user.dart';
import '/feature/firm/domain/models/firm_model.dart';
import '/feature/firm/ui/controller/controller.dart';

part 'repo.g.dart';

class FirmRepository {
  final Dio client;
  final List<FirmModel> _firmList = [];

  List<FirmModel> get firmList => _firmList;

  FirmModel? _currentSelectedFirm;

  FirmModel? get currentSelectedFirm => _currentSelectedFirm;

  FirmRepository({required this.client});

  Future<List<FirmModel>> fetchAllFirm() async {
    final response = await client.get('/v1/poultry-firms');
    final data = response.data as List<dynamic>;
    _firmList.clear();
    _firmList.addAll(data.map((e) => FirmModel.fromJson(e)).toList());
    return _firmList;
  }

  void setCurrentSelectedFirm(FirmModel firm) {
    _currentSelectedFirm = firm;
  }

  void clearCurrentSelectedFirm() {
    _currentSelectedFirm = null;
  }

  Future<FirmModel> fetchFirmById(int id) async {
    final response = await client.get('/v1/poultry-firms/$id');
    final data = response.data as Map<String, dynamic>;
    return FirmModel.fromJson(data);
  }

  bool get hasFirm {
    return _firmList.isNotEmpty;
  }
}

@riverpod
class CurrentSelectFirm extends _$CurrentSelectFirm {
  @override
  FirmModel? build() {
    redirectIfChange();
    return ref.watch(localUserRepositoryProvider).currentFirm;
  }

  Future<bool> setCurrentSelectFirm(FirmModel firmModel) async {
    try {
      await ref.read(localUserRepositoryProvider).saveFirm(firmModel).then((_) {
        state = firmModel;
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  void redirectIfChange() {
    ref.listenSelf((previous, next) {
      if (next?.id == previous?.id) return;
      ref.invalidate(fetchAllBatchByFirmProvider);

      ref.read(appRouterProvider).go('/firm/${next!.id}');
    });
  }
}

@Riverpod(keepAlive: true)
FirmRepository firmRepository(FirmRepositoryRef ref) {
  return FirmRepository(client: ref.watch(requestClientProvider).client);
}
