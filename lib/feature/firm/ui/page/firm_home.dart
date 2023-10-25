import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/feature/firm/ui/widget/no_firm.dart';
import '../../../../core/widget/async/async_value_widget.dart';
import '../controller/controller.dart';

class FirmHomePage extends ConsumerWidget {
  const FirmHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchFirm = ref.watch(fetchAllFirmProvider);
    return Scaffold(
      body: AsyncValueWidget(
        value: fetchFirm,
        data: (data) {
          if (data.isEmpty) {
            return const NoFirmFound();
          }
          return HookBuilder(builder: (ch) {
            return const Text("data");
          });
        },
      ),
    );
  }
}
