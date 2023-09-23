import 'package:dio/dio.dart';
import 'package:poulty_manager/core/client/request_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/feature/firm/domain/models/firm_model.dart';

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
    _firmList.addAll(data.map((e) => FirmModel.fromMap(e)).toList());
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
    return FirmModel.fromMap(data);
  }

  bool get hasFirm {
    return _firmList.isNotEmpty;
  }
}

@Riverpod(keepAlive: true)
FirmRepository firmRepository(FirmRepositoryRef ref) {
  return FirmRepository(client: ref.watch(requestClientProvider).client);
}
