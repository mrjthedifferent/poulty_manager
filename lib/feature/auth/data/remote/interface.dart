import '/feature/auth/domain/app_user.dart';

// part 'interface.g.dart';

abstract interface class AuthBaseRepository {
  AppUser? get currentUser;

  void signIn(dynamic data);
  Future<void> signOut();

  Stream<AppUser?> authStateChanges();

  void dispose();
}

// @Riverpod(keepAlive: true)
// class AuthenticationRepository extends _$AuthenticationRepository
//     implements AuthBaseRepository {
//   final _authState = InMemoryStore<AppUser?>(null);
//   @override
//   FutureOr<AppUser?> build() {
//     _authState.value = ref.watch(localUserRepositoryProvider).getUser();
//     return currentUser;
//   }

//   @override
//   Stream<AppUser?> authStateChanges() => _authState.stream;

//   @override
//   void dispose() => _authState.close();

//   @override
//   void signIn(data) {
//     if (data is AppUser) {
//       _authState.value = data;
//       ref.read(localUserRepositoryProvider).saveUser(data);
//       ref.invalidateSelf();
//       return;
//       // d.saveUser(data);
//     }

//     if (data is Map<String, dynamic>) {
//       _authState.value = AppUser.fromMap(data);
//       ref.read(localUserRepositoryProvider).saveUser(AppUser.fromMap(data));
//       ref.invalidateSelf();
//       return;
//     }
//   }

//   @override
//   Future<void> signOut() async {
//     _authState.value = null;
//     await ref.read(localUserRepositoryProvider).deleteUser();
//     ref.invalidateSelf();
//   }

//   @override
//   AppUser? get currentUser => _authState.value;
// }
