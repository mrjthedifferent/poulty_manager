import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/feature/auth/data/local/local_user.dart';
import '../../../../core/utils/memory_store.dart';
import '../../domain/app_user.dart';

part 'remote.g.dart';

class AuthRepository {
  AuthRepository(this.localUserRepository, {this.initialUser}) {
    _authState.value = initialUser ?? localUserRepository.getUser();
  }
  final AppUser? initialUser;

  final _authState = InMemoryStore<AppUser?>(null);

  final LocalUserRepository localUserRepository;

  Stream<AppUser?> authStateChanges() => _authState.stream;
  AppUser? get currentUser => _authState.value;

  void saveUser(dynamic data) {
    if (data is AppUser) {
      _authState.value = data;
      localUserRepository.saveUser(data);
    }

    if (data is Map<String, dynamic>) {
      _authState.value = AppUser.fromMap(data);
      localUserRepository.saveUser(AppUser.fromMap(data));
    }
  }

  Future<void> signOut() async {
    _authState.value = null;
    await localUserRepository.deleteUser();
  }

  void dispose() => _authState.close();
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  final auth = AuthRepository(ref.watch(localUserRepositoryProvider));
  ref.onDispose(() => auth.dispose());
  return auth;
}

@Riverpod(keepAlive: true)
Stream<AppUser?> authStateChanges(AuthStateChangesRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
}
