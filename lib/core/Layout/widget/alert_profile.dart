import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/config/constant/constant.dart';
import '/feature/auth/domain/user.dart';
import '/feature/vaccine/presentation/style/functions.dart';
import '/gen/assets.gen.dart';
import '../../../feature/firm/data/repository/repo.dart';

class AlertProfile extends StatelessWidget {
  const AlertProfile({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 400,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: switch (user.imageUrl) {
                      null => Assets.images.profileImage.provider(),
                      _ => NetworkImage(user.imageUrl!),
                    },
                  ),

                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        user.phone,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  // make a settings icon in trailing
                  const Spacer(),

                  const Icon(Icons.settings),
                ],
              ),
            ),
            const Divider(),

            //show list of all firm
            Consumer(builder: (ctx, ref, ch) {
              final allFirm = ref.watch(firmRepositoryProvider).firmList;

              if (allFirm.isEmpty) {
                return const Center(
                  child: Text('No Firm Found'),
                );
              }
              return Column(
                children: [
                  ...allFirm
                      .map(
                        (e) => ListTile(
                          leading: const Icon(Icons.home),
                          title: Text(e.name),
                          subtitle: Text(e.address ?? "no address"),
                          trailing: Styled.icon(Icons.more_vert),
                          onTap: () {
                            ref
                                .read(firmRepositoryProvider)
                                .setCurrentSelectedFirm(e);
                            Navigator.of(context).pop();
                            context.go('/firm/${e.id}');
                          },
                        ),
                      )
                      .toList(),
                  const Divider(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: primaryBtnStyle,
                      onPressed: () {
                        context.push("/firm");
                      },
                      icon: const Icon(Icons.add),
                      label:
                          Styled.text("Add New Firm").textColor(Colors.white),
                    ),
                  ),
                  KSized.h10,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: primaryBtnStyle.copyWith(),
                      onPressed: () {},
                      child: Styled.text("Log out").textColor(Colors.white),
                    ),
                  )
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
