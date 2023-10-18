// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poulty_manager/core/style/style.dart';
import 'package:poulty_manager/feature/batch/presentation/functions/utils.dart';
import 'package:styled_widget/styled_widget.dart';

import '/core/Layout/extension.dart';
import '../../../../config/constant/constant.dart';
import '../../../../core/hooks/request/use_http_request.dart';

class ReportGeneration extends HookConsumerWidget {
  final String batchId;
  const ReportGeneration(this.batchId, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var fetchData = ref.watch(
      makeAutoHttpRequestProvider(
        RequestOptions(
            path: "/v1/reports/poultry-batch/$batchId/result-analysis",
            method: "GET"),
      ),
    );

    final report = useAutoRequest(fetchData);

    return <Widget>[
      titleWithBackArrowAndAction("ফলাফল মূল্যায়ন",
          """ প্রতিদিনের ফলাফল দেখে আপনার ব্যাচের জন্য প্রয়োজনীয় পদক্ষেপ গ্রহন করুন
""", onBack: () {
        context.pop();
      }),
      KSized.h10,
      dataShow({
        "আজকের তারিখ": "১০,জানুয়ারি,২০২২",
        "ব্যাচ নামঃ": "ব্রয়লার",
        "সম্ভাব্য বিক্রয়ঃ": "২৭ শে অক্টোবর (রবিবার)",
        "মুরগি সংখ্যা": "১০২০"
      }),
      <Widget>[
        const ReportIndicator(
          color: Colors.red,
          name: "বিপদজনক",
        ),
        const ReportIndicator(
          color: Colors.yellow,
          name: "পদক্ষেপ গ্রহন",
        ),
        const ReportIndicator(
          color: Colors.green,
          name: "সুরক্ষিত",
        ),
      ]
          .toRow(mainAxisAlignment: MainAxisAlignment.spaceAround)
          .padding(all: 10),
      const ReportItem(
        title: "মোট মৃত মুরগি",
        recommendText: "৯০ গ্রাম",
        availableText: "৯০ গ্রাম",
        indicationColor: Colors.green,
      ),
      const ReportItem(
        title: "মুরগির গড় ওজন",
        recommendText: "০.০৫ গ্রাম",
        availableText: "৫%",
        indicationColor: Colors.red,
      ),
      const ReportItem(
        title: "খরচ (প্রতি মুরগি)",
        recommendText: "বিশ্লেষণ",
        availableText: "৩৫.১৯২ টাকা",
        indicationColor: Colors.yellow,
      ),
    ].toColumn().parent(page);
  }
}

class ReportItem extends StatelessWidget {
  final String recommendText;
  final String title;
  final String availableText;
  final Color indicationColor;
  final Color normalColor;

  const ReportItem({
    Key? key,
    required this.recommendText,
    required this.title,
    required this.availableText,
    required this.indicationColor,
    this.normalColor = const Color(0xff949CAD),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        KSized.w4,
        Styled.text(title),
        const Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 6,
          child: Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: indicationColor.withOpacity(0.2),
                  border: Border.all(color: indicationColor),
                ),
                child: Styled.text(availableText),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: normalColor.withOpacity(0.2),
                  border: Border.all(color: normalColor),
                ),
                child: Styled.text(recommendText).fittedBox(),
              ),
            ],
          ),
        ),
        KSized.w4,
      ],
    ).padding(vertical: 6);
  }
}

class ReportIndicator extends StatelessWidget {
  final Color color;
  final String name;
  const ReportIndicator({super.key, required this.color, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: color.withAlpha(80),
            border: Border.all(color: color, width: 3),
          ),
        ),
        KSized.w8,
        Styled.text(name),
      ],
    );
  }
}
