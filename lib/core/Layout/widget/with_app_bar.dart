import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poulty_manager/core/Layout/widget/alert_profile.dart';
import 'package:poulty_manager/feature/auth/data/remote/interface.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../gen/assets.gen.dart';
import 'app_bar_action_batch.dart';

class BaseAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const BaseAppBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user =
        ref.watch(authenticationRepositoryProvider.notifier).currentUser;
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
          showAdaptiveDialog(
            context: context,
            builder: (
              context,
            ) {
              return AlertDialog(
                content: AlertProfile(user: user!.user),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        })
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
