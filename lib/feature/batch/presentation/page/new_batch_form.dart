import 'package:flutter/material.dart';
import 'package:form_helper/form_helper.dart';
import 'package:poulty_manager/core/Layout/extention.dart';
import 'package:poulty_manager/feature/batch/presentation/functions/utils.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../config/constant/constant.dart';

class NewBatchForm extends StatelessWidget {
  const NewBatchForm({super.key});

  @override
  Widget build(BuildContext context) {
    final (:form, :handleReset, :handleSubmit, :register) = useFormBuilder();
    return <Widget>[
      titleWithBackArrow(
          "নতুন ব্যাচ শুরু করুন", "নতুন ব্যাচ শুরু করতে সকল তথ্য নিচে দিন"),
      KSized.h10,
      form(
        <Widget>[
          FormFields.dropDown('fruit',
              title: "মুরগির নাম *",
              initialValue: "chicken",
              options: {
                'মুরগি': 'chicken',
                'মুরগা': 'hen',
              }),
          FormFields.textField(
            'name',
            title: "ডিলারের নাম *",
          ),
        ].toColumn(),
      ),
    ].toColumn().parent(page);
  }
}
