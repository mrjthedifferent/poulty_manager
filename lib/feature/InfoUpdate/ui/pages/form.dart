import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poulty_manager/core/client/api_url.dart';
import 'package:poulty_manager/feature/InfoUpdate/ui/controller/controller.dart';

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
          requestTransformer: (data) {
            return {
              ...data,
              'poultry_batch_id': batchId,
              "lighting_start":
                  data['lighting_start'].toString().split(" ")[1].split(".")[0],
              "lighting_end":
                  data['lighting_end'].toString().split(" ")[1].split(".")[0],
            };
          },
        ),
      ),
    );
  }
}
