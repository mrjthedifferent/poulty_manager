// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poulty_manager/core/client/api_url.dart';

import '/core/widget/async/async_value_widget.dart';
import '/feature/shared/components/form_render.dart';
import '../controller/controller.dart';

class NewBatchForm extends ConsumerWidget {
  final String firmId;
  const NewBatchForm({
    Key? key,
    required this.firmId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formSettings = ref.watch(fetchFormSettingsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Batch"),
      ),
      body: AsyncValueWidget(
        value: formSettings,
        data: (data) => RenderFormAndUpdate(
          formSettings: data,
          requestUrl: ApiEndpoints.poultryBatches,
        ),
      ),
    );
  }
}
