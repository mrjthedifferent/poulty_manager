import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:styled_widget/styled_widget.dart';

import '/config/theme/color.dart';
import '/gen/assets.gen.dart';

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
      appBar: AppBar(
        leading: Assets.images.logo.image().padding(left: 10),
        leadingWidth: 100,
        actions: [
          AppBarActionBatch(
            onPressed: () {},
            color: Colors.green,
            text: '0',
            icon: Assets.icons.cart,
          ),
          AppBarActionBatch(
            icon: Assets.icons.noti,
            text: '12',
          ),
          Assets.images.profileImage
              .image(
                height: 40,
                width: 40,
              )
              .padding(right: 10)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        disabledElevation: 0.0,
        elevation: 0.0,
        clipBehavior: Clip.antiAlias,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const CircleBorder(),
        onPressed: () {},
        child: Assets.icons.floatHome.svg(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        fixedColor: AppColors.white2Color,
        backgroundColor: AppColors.primaryColor,
        currentIndex: navigationShell.currentIndex,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Assets.icons.menuHome.svg(),
            activeIcon: Assets.icons.menuHome.svg(color: Colors.white),
          ),
          BottomNavigationBarItem(
            label: 'Market',
            icon: Assets.icons.menuMarket.svg(),
            activeIcon: Assets.icons.menuMarket.svg(color: Colors.white),
          ),
          BottomNavigationBarItem(
            label: 'Report',
            icon: Assets.icons.menuReport.svg(),
            activeIcon: Assets.icons.menuReport.svg(color: Colors.white),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Assets.icons.setting.svg(),
            activeIcon: Assets.icons.setting.svg(color: Colors.white),
          ),
        ],
        onTap: _goBranch,
        // onDestinationSelected: _goBranch,
      ),
    );
  }
}

class AppBarActionBatch extends StatelessWidget {
  const AppBarActionBatch({
    super.key,
    required this.icon,
    required this.text,
    this.color,
    this.onPressed,
  });

  final SvgGenImage icon;
  final String text;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: [
        icon.svg(color: Colors.white).positioned(bottom: 0, left: 0),
        Styled.text(
          text,
        )
            .textColor(Colors.white)
            .textStyle(
              const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            )
            .padding(horizontal: 3, vertical: 1)
            .decorated(
              color: color ?? Colors.red,
              borderRadius: BorderRadius.circular(10),
            )
            .positioned(
              top: 0,
              right: 0,
            )
      ].toStack().constrained(height: 40, width: 36),
    );
  }
}
