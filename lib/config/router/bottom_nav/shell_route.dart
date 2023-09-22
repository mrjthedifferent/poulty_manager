import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poulty_manager/feature/batch/presentation/page/new_batch_form.dart';
import 'package:poulty_manager/feature/batch/presentation/page/new_batch_show.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../feature/batch/presentation/page/batch_home.dart';
import '../../../feature/home/fragment.dart';
import '../route.dart';
import 'scafold_nested_nav.dart';

final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _marketNavigatorKey = GlobalKey<NavigatorState>();
final _reportNavigatorKey = GlobalKey<NavigatorState>();
final _settingsNavigatorKey = GlobalKey<NavigatorState>();

final shellRouter = StatefulShellRoute.indexedStack(
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
              path: 'new',
              name: AppRouteName.newBatch.name,
              builder: (context, state) => const NewBatchForm(),
            ),
            GoRoute(
              path: 'batch',
              name: AppRouteName.batch.name,
              builder: (context, state) => const BatchHome(),
              routes: [
                GoRoute(
                  path: 'list',
                  name: AppRouteName.batchList.name,
                  builder: (context, state) => const NewBatchShow(),
                ),
              ],
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
);
