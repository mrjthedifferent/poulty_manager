import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poulty_manager/feature/doctor_visit/presentation/controller/controller.dart';
import 'package:styled_widget/styled_widget.dart';

import '/core/Layout/extension.dart';
import '/core/client/api_url.dart';
import '/core/widget/async/async_value_widget.dart';
import '/feature/shared/components/form_render.dart';
import '../../../InfoUpdate/ui/controller/controller.dart';

class DoctorVisitForm extends ConsumerWidget {
  const DoctorVisitForm({super.key, required this.batchId});

  final String batchId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final batchForm = ref.watch(
      batchInfoUpdateProvider(ApiEndpoints.poultryBatchDoctorVisitSettings),
    );

    return AsyncValueWidget(
      value: batchForm,
      data: (data) => RenderFormAndUpdate(
        formSettings: data,
        requestUrl: ApiEndpoints.poultryBatchDoctorVisit,
        onSuccess: (data) {
          ref.invalidate(fetchAllDoctorVisitProvider(batchId));
          context.pop();
        },
        requestTransformer: (data) {
          return {
            ...data,
            'poultry_batch_id': batchId,
          };
        },
      ),
    ).parent(page);
  }
}
