import 'package:poulty_manager/feature/auth/domain/app_user.dart';

abstract interface class AuthUserRepository {
  AppUser? currentUser;

  Future<AppUser?> signInWithPhoneAndPassword(String email, String password);

  Future<AppUser?> signInWithPhoneAndOTP(String phone, String otp);
}
