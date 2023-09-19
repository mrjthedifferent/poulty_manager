import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/app/main_comp.dart';
import '/feature/daily_advice/presentation/pages/daily_advice.dart';

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

final baseRouter = GoRouter(
  initialLocation: '/main',
  // navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      name: AppRouteName.main.name,
      path: '/',
      builder: (context, state) => const MainComponent(),
      routes: [
        GoRoute(
          path: "main",
          builder: (context, state) => Scaffold(
            appBar: AppBar(),
            body: ElevatedButton(
              onPressed: () {
                context.go("/main/home");
              },
              child: const Text("Daily Advice"),
            ),
          ),
          routes: [
            GoRoute(
              path: 'home',
              builder: (context, state) => const DailyAdvice(),
            ),
          ],
          // routes: [
          //   shellRouter,
          // ],
        ),
        GoRoute(
          path: 'template',
          builder: (context, state) => const DailyAdvice(),
        ),
      ],
    ),
  ],
);
