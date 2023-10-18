import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart' show PlatformFile;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poulty_manager/feature/firm/ui/controller/controller.dart';
import 'package:styled_widget/styled_widget.dart';

import '/core/Layout/extension.dart';
import '/core/hooks/request/get_client.dart';
import '/core/widget/async/request_handle.dart';
import '/feature/firm/ui/widget/add_firm.dart';

class AddNewFirmPage extends HookConsumerWidget {
  const AddNewFirmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addNewFirmAction = useRequestHandler(
      ref.watch(requestHandlerProvider),
    );

    return RequestHandleWidget(
      initial: () => AddFirmField(onSubmit: (data) {
        // make data to form data , check if file is null or not, if not then add it to the form data
        final formData = FormData();

        data.forEach((key, value) {
          if (value is List) {
            for (var i = 0; i < value.length; i++) {
              final element = value[i];
              if (element is PlatformFile) {
                formData.files.add(
                  MapEntry(
                    "$key[$i]",
                    MultipartFile.fromFileSync(
                      element.path!,
                      filename: element.name,
                    ),
                  ),
                );
              }
            }
          } else {
            if (value is PlatformFile) {
              formData.files.add(
                MapEntry(
                  key,
                  MultipartFile.fromFileSync(
                    value.path!,
                    filename: value.name,
                  ),
                ),
              );
            } else {
              formData.fields.add(
                MapEntry(key, value ?? ""),
              );
            }
          }
        });

        addNewFirmAction.trigger(
          '/v1/poultry-firms',
          data: formData,
          method: 'POST',
          hasFile: true,
          onSuccess: (data) {
            ref.invalidate(fetchAllFirmProvider);
            context.pop();
          },
        );
      }).parent(page),
      value: addNewFirmAction.status,
      success: (data) {
        return Center(
          child: Text('Success:$data'),
        );
      },
    );
  }
}
