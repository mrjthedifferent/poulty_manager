import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poulty_manager/config/constant/constant.dart';
import 'package:poulty_manager/feature/firm/data/repository/repo.dart';
import 'package:poulty_manager/feature/vaccine/presentation/style/functions.dart';
import 'package:styled_widget/styled_widget.dart';

class SelectFirmWidget extends ConsumerWidget {
  const SelectFirmWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allFirm = ref.watch(firmRepositoryProvider).firmList;
    return <Widget>[
      const Text(
        'ফার্ম সিলেক্ট করুন',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      ListView.builder(
        shrinkWrap: true,
        itemCount: allFirm.length,
        itemBuilder: (context, index) {
          final firm = allFirm[index];
          return ListTile(
            leading: const Icon(Icons.home),
            title: Text(firm.name),
            subtitle: Text(firm.address ?? "no address"),
            onTap: () {
              ref.read(firmRepositoryProvider).setCurrentSelectedFirm(firm);
              context.push('/firm/${firm.id}');
            },
          );
        },
      ),

      // CREATE FIRM BUTTON
      KSized.h10,
      ElevatedButton(
        style: primaryBtnStyle,
        onPressed: () {
          debugPrint('Create Firm');
          context.go('/firm');
        },
        child: Styled.text('ফার্ম তৈরি করুন').textColor(Colors.white),
      ),
    ].toColumn();
  }
}
