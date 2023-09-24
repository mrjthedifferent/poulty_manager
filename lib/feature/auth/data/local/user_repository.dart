import 'package:hive/hive.dart';
import 'package:poulty_manager/core/exceptions/map_to_json.dart';

import '/feature/auth/data/local/local_user.dart';
import '/feature/auth/domain/app_user.dart';
import '../../../firm/domain/models/firm_model.dart';

class UserLocalRepository implements LocalUserRepository {
  final Box<String> _userBox;

  static const String userKey = 'user-store-key';
  static const String firmKey = 'firm-store-key';

  UserLocalRepository({required Box<String> userBox}) : _userBox = userBox;

  Future<Box<String>> initBox() => Hive.openBox<String>(userKey);

  static Future<UserLocalRepository> ready() async {
    return UserLocalRepository(userBox: await Hive.openBox<String>(userKey));
  }

  @override
  Future<void> deleteUser() {
    return _userBox.delete(userKey);
  }

  @override
  Future<bool> saveUser(AppUser user) async {
    try {
      await _userBox.put(userKey, user.toJson());

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  AppUser? getUser() {
    final String? userJson = _userBox.get(userKey);
    if (userJson == null) {
      return null;
    }
    return AppUser.fromJson(userJson);
  }

  @override
  Future<bool> saveFirm(FirmModel firm) async {
    try {
      await _userBox.put(firmKey, firm.toMap().toJson());

      return true;
    } catch (e) {
      return false;
    }
  }
}
