import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '/core/widget/async/async_value_widget.dart';
import '/feature/batch/presentation/widgets/batch_item.dart';
import '/feature/firm/ui/controller/controller.dart';

class BatchMainHome extends HookConsumerWidget {
  const BatchMainHome({Key? key, required this.firmId}) : super(key: key);
  final String firmId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = fetchAllBatchByFirmProvider(firmId);
    final fetchBatchList = ref.watch(provider);
    return Scaffold(
      appBar: AppBar(
        title: Styled.text("ব্যাচ ম্যানেজমেন্ট")
            .textColor(Colors.white)
            .fontSize(18),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(provider.future),
        child: Stack(
          fit: StackFit.expand,
          children: [
            AsyncValueWidget(
              value: fetchBatchList,
              data: (batches) {
                if (batches.isEmpty) {
                  return const Center(
                    child: Text("No Batch Found"),
                  );
                }
                return ListView.builder(
                  itemCount: batches.length,
                  itemBuilder: (context, index) {
                    final batch = batches[index];
                    return SingleBatchShow(batch: batch, serial: index + 1);
                  },
                );
              },
            ).padding(horizontal: 10, vertical: 16),
            Positioned(
              bottom: 10,
              right: 10,
              child: FloatingActionButton(
                onPressed: () {
                  context.push("/firm/$firmId/batch/new");
                },
                child: const Icon(Icons.add),
              ),
            )
          ],
        ),
      ),
    );
  }
}
