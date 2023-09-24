import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poulty_manager/config/router/router_refresh_stream.dart';
import 'package:poulty_manager/feature/auth/data/remote/remote.dart';
import 'package:poulty_manager/feature/auth/pages/registation/account_complete_form.dart';
import 'package:poulty_manager/feature/firm/ui/page/add_firm_page.dart';
import 'package:poulty_manager/feature/firm/ui/page/firm_home.dart';
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

  // Auth
  login,
  register,
  otp,
  accountComplete,
}

@Riverpod(keepAlive: true)
GoRouter appRouter(AppRouterRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      final path = state.uri.path;
      if (isLoggedIn) {
        if (path.contains("auth")) {
          return '/';
        }
        return null;
      } else {
        if (!path.contains("auth")) {
          return '/auth/login';
        }

        return null;
      }
    },
    refreshListenable: GoRouterRefreshStream(
      authRepository.authStateChanges(),
    ),
    routes: [
      GoRoute(
        path: '/',

        builder: (context, state) => const FirmHomePage(),
        routes: [
          // Authentication Routes

          GoRoute(
            path: 'auth',
            builder: (context, state) => Container(),
            routes: [
              GoRoute(
                name: AppRouteName.login.name,
                path: 'login',
                builder: (context, state) => const SignInPage(),
              ),
              GoRoute(
                path: 'register',
                name: AppRouteName.register.name,
                builder: (context, state) => const RegistrationPhonePage(),
              ),
              GoRoute(
                path: 'otp',
                name: AppRouteName.otp.name,
                builder: (context, state) {
                  final uri = state.uri;
                  final phone = uri.queryParameters['phone'] ?? "no phone";
                  final otp = uri.queryParameters['otp'] ?? "no otp";
                  debugPrint("Phone:$phone OTP:$otp, path:${state.fullPath}");
                  return OTPEnterScreen(
                    phone: phone,
                    otp: otp,
                  );
                },
              ),
              GoRoute(
                name: AppRouteName.accountComplete.name,
                path: 'account-complete',
                builder: (context, state) {
                  final uri = state.uri;
                  final phone = uri.queryParameters['phone'] ?? "no phone";
                  final otp = uri.queryParameters['otp'] ?? "no otp";
                  return AccountCompleteForm(
                    phone: phone,
                    otp: otp,
                  );
                },
              ),
            ],
          ),
          // Batch Routes

          GoRoute(
            path: 'firm',
            builder: (context, state) => const AddNewFirmPage(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) => const HomeFragments(),
              ),
            ],
          ),

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
