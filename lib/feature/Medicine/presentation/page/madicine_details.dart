import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_helper/form_helper.dart';
import 'package:styled_widget/styled_widget.dart';

import '/config/constant/constant.dart';
import '../../../../core/Layout/extension.dart';

class MedicineDetails extends StatelessWidget {
  const MedicineDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      MakeForm(
        fields: [
          FormHelperDropDown('mourgi_name',
              title: "মুরগির নাম *",
              initialValue: "মুরগির নাম ১",
              options: {
                "1": "মুরগির নাম ১",
                "2": "মুরগির নাম ২",
                "3": "মুরগির নাম ৩",
              }),
        ],
        onSubmit: (val) {
          debugPrint(val.toString());
        },
        onCancel: () {},
      )
    ].toColumn().parent(page);
    // final (:form, :handleSubmit, :handleReset, :register) = useFormBuilder();
    // return <Widget>[
    //   form(
    //     <Widget>[
    //       register(
    //         "date",
    //         (field) => PickDate.datePicker(
    //           (date) {
    //             field.didChange(date);
    //           },
    //           hint: '১ জানুয়ারি ২০২২',
    //           title: 'ভিজিটের তারিখ *',
    //         ),
    //       ),
    //       FormHelperDatePicker(
    //         "new_date",
    //         title: "ভিজিটের তারিখ *",
    //         hint: '১ জানুয়ারি ২০২২',
    //       ).toWidget,
    //       FormFields.textField(
    //         "doctor_number",
    //         title: 'ডাক্তারের নাম্বার *',
    //         hint: "Enter your phone number",
    //       ),
    //       FormHelperSingleFilePicker("doctor_report", title: "প্রেসক্রিপশন *")
    //           .toWidget,
    //       FormHelperTextFieldWithSuffixDropdown(
    //         "weight",
    //         title: "Hen Weight",
    //         options: {
    //           "kg": "Kilogram",
    //           "gm": "Gram",
    //           "mg": "Milligram",
    //         },
    //         suffixFieldName: "weight_unit",
    //         suffixHint: "Unit",
    //       ).toWidget,
    //     ].toColumn(),
    //   ),
    //   ElevatedButton(
    //     onPressed: () {
    //       handleSubmit(
    //         (value) => debugPrint(
    //           value.toString(),
    //         ),
    //       );
    //     },
    //     style: primaryBtnStyle,
    //     child: Styled.text('Save').fontSize(18).textColor(Colors.white),
    //   ).width(double.infinity).padding(all: 14),
    // ].toColumn().parent(page);
  }
}

class PickDate extends StatelessWidget {
  const PickDate({
    super.key,
    this.onDateSelected,
    required this.hint,
    this.initYear = 2020,
    this.endYear = 2025,
  });
  final String hint;
  final int initYear;
  final int endYear;
  final void Function(String selectedDate)? onDateSelected;
  static Widget datePicker(
    void Function(String) onDateSelected, {
    required String hint,
    required String title,
  }) {
    return [
      Styled.text(title).padding(left: 3),
      PickDate(
        onDateSelected: onDateSelected,
        hint: hint,
      )
    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start);
  }

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (ctx) {
      final selectDate = useState<String?>(null);
      return [
        Styled.icon(Icons.calendar_month),
        KSized.w10,
        Styled.text(selectDate.value ?? hint)
      ]
          .toRow()
          .width(double.infinity)
          .padding(all: 14)
          .decorated(
            color: Colors.grey.shade100,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          )
          .gestures(onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(initYear),
          lastDate: DateTime(endYear),
        ).then(
          (value) => {
            if (value != null)
              {
                selectDate.value = value.toString().split(' ')[0],
                if (onDateSelected != null) onDateSelected!(selectDate.value!),
              }
          },
        );
      });
    });
  }
}
