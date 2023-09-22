import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      // appBar: defaultAppBar(context),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   disabledElevation: 0.0,
      //   elevation: 0.0,
      //   clipBehavior: Clip.antiAlias,
      //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //   shape: const CircleBorder(),
      //   onPressed: () {},
      //   child: Assets.icons.floatHome.svg(),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   showUnselectedLabels: true,
      //   fixedColor: AppColors.white2Color,
      //   backgroundColor: AppColors.primaryColor,
      //   currentIndex: navigationShell.currentIndex,
      //   items: [
      //     BottomNavigationBarItem(
      //       label: 'Home',
      //       icon: Assets.icons.menuHome.svg(),
      //       activeIcon: Assets.icons.menuHome.svg(color: Colors.white),
      //     ),
      //     BottomNavigationBarItem(
      //       label: 'Market',
      //       icon: Assets.icons.menuMarket.svg(),
      //       activeIcon: Assets.icons.menuMarket.svg(color: Colors.white),
      //     ),
      //     BottomNavigationBarItem(
      //       label: 'Report',
      //       icon: Assets.icons.menuReport.svg(),
      //       activeIcon: Assets.icons.menuReport.svg(color: Colors.white),
      //     ),
      //     BottomNavigationBarItem(
      //       label: 'Settings',
      //       icon: Assets.icons.setting.svg(),
      //       activeIcon: Assets.icons.setting.svg(color: Colors.white),
      //     ),
      //   ],
      //   onTap: _goBranch,
      //   // onDestinationSelected: _goBranch,
      // ),
    );
  }
}
