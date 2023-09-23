import 'package:go_router/go_router.dart';
import 'package:poulty_manager/config/router/router_refresh_stream.dart';
import 'package:poulty_manager/feature/auth/data/remote/remote.dart';
import 'package:poulty_manager/feature/home/fragment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/feature/Medicine/presentation/page/page.dart';
import '/feature/auth/pages/pages.dart';
import '/feature/daily_advice/presentation/pages/daily_advice.dart';
import '/feature/doctor_visit/presentation/pages/pages.dart';
import '/feature/vaccine/presentation/pages/pages.dart';
import '../../feature/batch/presentation/page/page.dart';

part 'route.g.dart';

enum AppRouteName {
  main,
  home,
  market,
  report,
  settings,
  allComponents,
  batch,
  newBatch,
  batchList,
}

@Riverpod(keepAlive: true)
GoRouter appRouter(AppRouterRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      final path = state.uri.path;
      if (isLoggedIn) {
        return '/';
      } else {
        if (path.contains("auth")) {
          return null;
        }
        return '/auth/login';
      }
    },
    refreshListenable: GoRouterRefreshStream(
      authRepository.authStateChanges(),
    ),
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeFragments(),
        routes: [
          // Authentication Routes

          GoRoute(
            path: 'auth',
            redirect: (_, __) => '/auth/login',
            routes: [
              GoRoute(
                path: 'login',
                builder: (context, state) => const SignInPage(),
              ),
              GoRoute(
                path: 'register',
                builder: (context, state) => const RegistrationPhonePage(),
              ),
              GoRoute(
                path: 'otp',
                builder: (context, state) => const OTPEnterScreen(),
              ),
              GoRoute(
                path: 'account-complete',
                builder: (context, state) => const AccountCompletePage(),
              ),
            ],
          ),
          // Batch Routes
          GoRoute(
            path: 'batch',
            builder: (context, state) => const BatchHome(),
            routes: [
              GoRoute(
                path: 'new',
                builder: (context, state) => const NewBatchForm(),
              ),
              GoRoute(
                path: 'show',
                builder: (context, state) => const NewBatchShow(),
              ),
            ],
          ),

          // Vaccine Routes
          GoRoute(
            path: 'vaccine',
            builder: (context, state) => const VaccineHomePage(),
            routes: const [],
          ),
          GoRoute(
            path: 'medicine',
            builder: (context, state) => const MedicineShow(),
            routes: [
              GoRoute(
                path: 'new',
                builder: (context, state) => const MedicineDetails(),
              ),
            ],
          ),
          GoRoute(
            path: 'doctor-visit',
            builder: (context, state) => const DoctorVisitShow(),
          ),
          GoRoute(
            path: 'daily-advice',
            builder: (context, state) => const DailyAdvice(),
          ),
        ],
        // builder: (context, state) => const DailyAdvicePage(),
      ),
    ],
  );
}
