import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '/core/Layout/widget/app_bar_action_batch.dart';
import '/gen/assets.gen.dart';
import '../../../config/theme/color.dart';

PreferredSizeWidget defaultAppBar(BuildContext context) {
  return AppBar(
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
          .gestures(onTap: () {
        //show an scrollable alert dialogue, with a list of options for the user to select

        showAdaptiveDialog(
            context: context,
            builder: (
              context,
            ) {
              return AlertDialog(
                title: const Text('Select an option'),
                content: const SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Profile'),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Approve'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      })
    ],
  );
}

Widget defaultBottomNav(
    {required int currentIndex, required ValueChanged<int> onTap}) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: true,
    fixedColor: AppColors.white2Color,
    backgroundColor: AppColors.primaryColor,
    currentIndex: currentIndex,
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
    onTap: onTap,
    // onDestinationSelected: _goBranch,
  );
}
