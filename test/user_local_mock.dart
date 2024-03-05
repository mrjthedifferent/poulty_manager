import 'package:poulty_manager/feature/auth/data/local/local_user.dart';
import 'package:poulty_manager/feature/auth/domain/app_user.dart';
import 'package:poulty_manager/feature/firm/domain/models/firm_model.dart';

class UserMockRepo implements LocalUserRepository {
  @override
  FirmModel? get currentFirm => null;

  @override
  Future<void> deleteUser() {
    throw UnimplementedError();
  }

  @override
  AppUser? get getUser => null;

  @override
  Future<void> saveFirm(FirmModel firm) async {
    return;
  }

  @override
  Future<void> saveUser(AppUser user) async {
    return;
  }
}
