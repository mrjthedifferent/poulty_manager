import 'package:flutter/material.dart';
import 'package:poulty_manager/config/config.dart';
import 'package:poulty_manager/config/constant/constant.dart';
import 'package:poulty_manager/feature/batch/presentation/functions/utils.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/Layout/extension.dart';

class MedicineShow extends StatelessWidget {
  const MedicineShow({super.key});

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      titleWithBackArrowAndAction(
          "ঔষধ সময়সূচি", "মুরগিকে সুস্থ রাখতে সময়ময় ঔষধ খাওয়ান",
          onBack: () {}),
      KSized.h12,
      medicineTile("রেনেমাইসিন", "১০ মিনিট পর", 0.5),
      medicineTile("Ansamble", "20 মিনিট পর", 0.2),
    ].toColumn().parent(page);
  }

  Widget medicineTile(
    String medicineName,
    String nextDose,
    double progress,
  ) {
    return [
      [
        [
          Styled.text(medicineName).fontSize(16).bold(),
          RichText(
            text: TextSpan(
              text: "পরবর্তী ডোজঃ  ",
              style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: nextDose,
                  style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
        Styled.icon(Icons.delete_outline, color: Colors.grey.shade500, size: 30)
            .padding(all: 4)
            .decorated(color: Colors.grey.shade300, shape: BoxShape.circle),
      ]
          .toRow(mainAxisAlignment: MainAxisAlignment.spaceAround)
          .padding(all: 10)
          .decorated(
            // make only bottom border
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
          ),
      [
        [
          LinearProgressIndicator(
            value: progress,
            borderRadius: BorderRadius.circular(10),
            minHeight: 15,
            backgroundColor: Colors.grey.shade200,
            color: AppColors.primaryColor,
          ),
          Styled.text("${(progress * 100).toInt()}% সম্পন্ন ")
              .fontSize(12)
              .textColor(Colors.grey.shade700)
        ].toStack(alignment: AlignmentDirectional.center).expanded(),
        KSized.w10,
        Styled.text("সম্পন্ন")
            .textColor(Colors.white)
            .padding(vertical: 8, horizontal: 16)
            .decorated(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
      ].toRow().padding(all: 8)
    ].toColumn().decorated(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        );
  }
}
