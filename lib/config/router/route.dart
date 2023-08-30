import 'package:go_router/go_router.dart';

import '/app/main_comp.dart';
import '/config/router/route_name.dart';
import '/feature/all_components.dart';

final baseRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: AppRouteName.home,
      path: '/',
      builder: (context, state) => const MainComponent(),
    ),
    GoRoute(
      name: AppRouteName.component,
      path: '/component',
      builder: (context, state) => const AllComponents(),
    ),
  ],
);
