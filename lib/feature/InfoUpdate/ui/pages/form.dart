import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/core/client/api_url.dart';
import '/feature/InfoUpdate/ui/controller/controller.dart';
import '../../../../core/widget/async/async_value_widget.dart';
import '../../../shared/components/form_render.dart';

class BatchInfoUpdateFormPage extends HookConsumerWidget {
  const BatchInfoUpdateFormPage({super.key, required this.batchId});

  final String batchId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final batchForm = ref.watch(
      batchInfoUpdateProvider(ApiEndpoints.poultryBatchInfoSettings),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("তথ্য হালনাগাদ"),
      ),
      body: AsyncValueWidget(
        value: batchForm,
        data: (data) => RenderFormAndUpdate(
          formSettings: data,
          requestUrl: ApiEndpoints.poultryBatchInfo,
          onSuccess: (data) {
            ref.invalidate(batchInfoUpdateProvider(batchId));
            context.pop();
          },
          requestTransformer: (data) {
            debugPrint(data.toString());

            return {
              ...data,
              'poultry_batch_id': batchId,
              // "lighting_start":
              //     data['lighting_start'].toString().split(" ")[1].split(".")[0],
              // "lighting_end":
              //     data['lighting_end'].toString().split(" ")[1].split(".")[0],
            };
          },
        ),
      ),
    );
  }
}
