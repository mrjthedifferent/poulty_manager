// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:poulty_manager/config/constant/constant.dart';
import 'package:poulty_manager/interface/image_text.dart';
import 'package:styled_widget/styled_widget.dart';

import '/feature/batch/domain/domain.dart';
import '/feature/batch/presentation/widgets/two_text_column.dart';
import '../../../../config/theme/color.dart';
import '../../../../gen/assets.gen.dart';

class SingleBatchShow extends HookWidget {
  final ModelBatch batch;
  final int serial;
  const SingleBatchShow({
    super.key,
    required this.batch,
    required this.serial,
  });

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);
    if (isExpanded.value) {
      return BatchExpand(
        batch: batch,
        serialNo: serial,
        onTap: () {
          isExpanded.value = false;
        },
      );
    }
    return InitWidget(
      serialNo: serial,
      batchName: batch.poultryName,
      startDate: batch.hatchDateFormatted ?? "",
      batchId: "${batch.id}",
      onTap: () {
        isExpanded.value = true;
      },
    );
  }
}

class InitWidget extends StatelessWidget {
  final int serialNo;
  final String batchName;
  final String startDate;
  final String batchId;
  final VoidCallback? onTap;
  const InitWidget({
    Key? key,
    required this.serialNo,
    required this.batchName,
    required this.startDate,
    required this.batchId,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return [
      [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Styled.text("$serialNo"),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Styled.text(batchName),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Styled.text(startDate),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Styled.text(batchId),
        ),
      ].toRow(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      const SizedBox(
        height: 20,
      ),
      Styled.text("বিস্তারিত")
          .padding(horizontal: 16, vertical: 6)
          .decorated(
            border: Border.all(
              color: AppColors.primaryColor,
            ),
            color: AppColors.primaryColor.withAlpha(50),
            borderRadius: BorderRadius.circular(6),
          )
          .gestures(onTap: onTap)
    ].toColumn().padding(all: 6).card(color: Colors.white);
  }
}

class BatchExpand extends StatelessWidget {
  const BatchExpand({
    Key? key,
    required this.batch,
    required this.serialNo,
    this.onTap,
  }) : super(key: key);

  final ModelBatch batch;
  final int serialNo;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KSized.h12,
        [
          TwoTextColumn(uppertext: "নং", lowerText: "$serialNo"),
          TwoTextColumn(
              uppertext: "ব্যাচের নামঃ", lowerText: batch.poultryName),
          TwoTextColumn(
              uppertext: "শুরুর তারিখ",
              lowerText: batch.hatchDateFormatted ?? "no Date"),
          TwoTextColumn(uppertext: "ব্যাচ ID", lowerText: "${batch.id}"),
        ]
            .toRow(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            )
            .constrained(minHeight: 40, maxHeight: 60),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            shrinkWrap: true,
            primary: false,
            crossAxisCount: 2,
            childAspectRatio: 2.5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              BatchSmallCardShow(
                title: "মোট জীবিত মুরগী",
                value: batch.totalAliveChicks,
                image: Assets.icons.henOutline.svg(),
              ),
              BatchSmallCardShow(
                title: "মুর্গির গড় ওজন",
                value: batch.avgWeight,
                image: Assets.icons.weight.svg(),
              ),
              BatchSmallCardShow(
                title: "উৎপাদন ব্যায় (কেজি)",
                value: batch.manufactureCostKg,
                image: Assets.icons.uppadon.svg(),
              ),
              BatchSmallCardShow(
                title: "মোট ব্যায়",
                value: batch.totalCost,
                image: Assets.icons.totalBai.svg(),
              ),
            ],
          ),
        ),

        // gRID
        [
          CreateGridItem(
            image: Assets.images.rogPotikar.image(
              height: 50,
            ),
            text: Styled.text("তথ্য হালনাগাদ").fontSize(10),
            onPressed: () {
              context.push("/info-update/${batch.id}");
            },
          ),
          CreateGridItem(
            image: Assets.images.amarTaka.image(
              height: 50,
            ),
            text: Styled.text("ডাক্তার ভিজিট").fontSize(10),
            onPressed: () {
              context.push("/doctor-visit/${batch.id}");
            },
          ),
          CreateGridItem(
            image: Assets.images.allCalculator.image(
              height: 50,
            ),
            text: Styled.text("পরামর্শ প্রতিদিন").fontSize(10),
            onPressed: () {
              context.push("/daily-advice/${batch.id}");
            },
          ),
          CreateGridItem(
            image: Assets.images.bazarBisleshon.image(
              height: 50,
            ),
            text: Styled.text("ভ্যাক্সিন").fontSize(10),
            onPressed: () {
              context.push("/vaccine/${batch.id}");
            },
          ),
          CreateGridItem(
            image: Assets.images.farmControl.image(
              height: 50,
            ),
            text: Styled.text("ফাইনাল রিপোর্ট").fontSize(10),
            onPressed: () {
              context.push("/report/${batch.id}");
            },
          ),
          CreateGridItem(
            image: Assets.images.kroyOntorvukti.image(
              height: 50,
            ),
            text: Styled.text("ঔষধের সময়সুচি").fontSize(8),
            onPressed: () {
              context.push("/medicine/${batch.id}");
            },
          ),
        ].grid(
          primary: true,
          shrinkWrap: true,
        ),
        Styled.icon(Icons.arrow_upward)
            .decorated(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            )
            .gestures(
              onTap: onTap,
            ),
      ],
    ).card(
      color: Colors.white,
    );
  }
}
