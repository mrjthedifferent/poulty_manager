import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:poulty_manager/feature/batch/presentation/functions/utils.dart';
import 'package:poulty_manager/feature/batch/presentation/page/new_batch_show.dart';
import 'package:poulty_manager/feature/vaccine/presentation/style/functions.dart';
import 'package:poulty_manager/gen/assets.gen.dart';
import 'package:styled_widget/styled_widget.dart';

import '/config/constant/constant.dart';
import '../../../../core/Layout/extension.dart';

class MedicineDetails extends StatelessWidget {
  const MedicineDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      titleWithBackArrowAndAction(
        "রেনেমাইসিন",
        "  ",
        trailing: Styled.icon(Icons.edit, size: 26),
        onBack: () {},
      ),
      NewBatchShow.batchItem("ডোজ শুরু হওয়ার তারিখঃ", "২৮/১০/২০২২ (শুক্রবার"),
      NewBatchShow.batchItem("ডোজ শুরু হওয়ার তারিখঃ", "২৮/১০/২০২২ (শুক্রবার"),
      NewBatchShow.batchItem("ডোজ চলছেঃ", "২য় দিন"),
      KSized.h10,
      [
        [
          [
            Assets.icons.sun.svg(),
            KSized.w8,
            Styled.text("সকাল"),
          ].toRow(),
          const Spacer(),
          ElevatedButton(
            style: primaryBtnStyle,
            onPressed: () {},
            child: Styled.text("সম্পন্ন").textColor(Colors.white),
          ),
        ].toRow(),
        const Divider(),
        medicineCardText(
            medicineTime: "৮ঃ৫৫ মিনিট",
            medicineQuantity: "৮ঃ৫৫ মিনিট",
            waterQuantity: "৮ঃ৫৫ মিনিট"),
      ].toColumn().padding(all: 10).card(),
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

  Widget medicineCardText(
      {required String medicineTime,
      required String medicineQuantity,
      required String waterQuantity}) {
    return [
      cardTextItem("ঔষধের সময়ঃ", "৮ঃ৫৫ মিনিট"),
      cardTextItem("ঔষধের পরিমানঃ", "১ মিলিগ্রাম"),
      cardTextItem("পানির পরিমানঃ", "২ লিটার"),
    ].toColumn();
  }

  Widget cardTextItem(String title, String value) {
    return [
      Styled.text(title).bold().textColor(Colors.grey.shade500),
      KSized.w12,
      Styled.text(value).bold(),
    ].toRow();
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
