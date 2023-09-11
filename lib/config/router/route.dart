import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poulty_manager/feature/batch/presentation/widgets/batch_home.dart';
import 'package:poulty_manager/feature/home/fragment.dart';
import 'package:poulty_manager/feature/vaccine/presentation/pages/vaccine_home.dart';
import 'package:styled_widget/styled_widget.dart';

import '/app/main_comp.dart';
import 'scafold_nested_nav.dart';

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

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _marketNavigatorKey = GlobalKey<NavigatorState>();
final _reportNavigatorKey = GlobalKey<NavigatorState>();
final _settingsNavigatorKey = GlobalKey<NavigatorState>();

final baseRouter = GoRouter(
  initialLocation: '/template',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      name: AppRouteName.main.name,
      path: '/',
      builder: (context, state) => const MainComponent(),
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNestedNavigation(
              navigationShell: navigationShell,
            );
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _homeNavigatorKey,
              routes: [
                GoRoute(
                  path: 'home',
                  name: AppRouteName.home.name,
                  builder: (context, state) => const HomeFragments(),
                  routes: [
                    GoRoute(
                      path: 'batch',
                      name: AppRouteName.batch.name,
                      builder: (context, state) => const BatchHome(),
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _marketNavigatorKey,
              routes: [
                GoRoute(
                  path: 'market',
                  name: AppRouteName.market.name,
                  builder: (context, state) => Styled.text('Market'),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _reportNavigatorKey,
              routes: [
                GoRoute(
                  path: 'report',
                  name: AppRouteName.report.name,
                  builder: (context, state) => Styled.text('reports'),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _settingsNavigatorKey,
              routes: [
                GoRoute(
                  path: 'settings',
                  name: AppRouteName.settings.name,
                  builder: (context, state) => Styled.text('Settings'),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: 'template',
          builder: (context, state) => const VaccineHomePage(),
        ),
      ],
    ),
  ],
);
