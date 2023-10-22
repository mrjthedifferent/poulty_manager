import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poulty_manager/feature/doctor_visit/presentation/controller/controller.dart';
import 'package:styled_widget/styled_widget.dart';

import '/config/config.dart';
import '/core/Layout/widget/with_app_bar.dart';
import '/feature/batch/presentation/functions/utils.dart';
import '/gen/assets.gen.dart';
import '../../../../config/constant/constant.dart';
import '../../../../core/widget/async/async_value_widget.dart';

class DoctorVisitShow extends HookConsumerWidget {
  const DoctorVisitShow(this.batchId, {super.key});
  final String batchId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchDoctorVisit = ref.watch(fetchAllDoctorVisitProvider(batchId));

    return Scaffold(
      appBar: const BaseAppBar(),
      body: AsyncValueWidget(
          value: fetchDoctorVisit,
          data: (doctorVisits) {
            if (doctorVisits.isEmpty) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  const Center(
                    child: Text("No doctor visit found"),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: FloatingActionButton(
                      onPressed: () async {
                        context.push("/doctor-visit/$batchId/new");
                      },
                      child: const Icon(Icons.add),
                    ),
                  )
                ],
              );
            }
            return Stack(
              fit: StackFit.expand,
              children: [
                <Widget>[
                  KSized.h12,
                  KSized.h12,
                  titleWithBackArrowAndAction("ডাক্তার ভিজিট",
                      "মুরগী সুস্থ রাখতে নির্দিষ্ট দিনের মধ্যে ভ্যাক্সিন সম্পন্ন করুন এবং নিশ্চিন্তে খামার পরিচালনা করুন।",
                      onBack: () {
                    Navigator.pop(context);
                  }),
                  KSized.h10,
                  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: doctorVisits.length,
                    itemBuilder: (BuildContext context, int index) {
                      final e = doctorVisits[index];
                      return doctorVisitTile(
                          Assets.images.doctor,
                          e.doctorName ?? "",
                          e.doctorDegree ?? "",
                          e.doctorVisitDateFormatted ?? "");
                    },
                  ),

                  // AsyncValueWidget(
                  //   value: doctorVisit,
                  //   data: (data) {
                  //     final parseData =
                  //         List<Map<String, dynamic>>.from(data.data ?? []);
                  //     final doctors =
                  //         parseData.map((e) => DoctorVisitModel.fromJson(e));
                  //     return Column(
                  //       children: doctors
                  // .map((e) => doctorVisitTile(
                  //     Assets.images.doctor,
                  //     e.doctorName ?? "",
                  //     e.doctorDegree ?? "",
                  //     e.doctorVisitDateFormatted ?? ""))
                  //           .toList(),
                  //     ).scrollable().constrained(
                  //           height: MediaQuery.of(context).size.height * 0.8,
                  //         );
                  //   },
                  // )
                ].toColumn(),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: FloatingActionButton(
                    onPressed: () async {
                      context.push("/doctor-visit/$batchId/new");
                    },
                    child: const Icon(Icons.add),
                  ),
                )
              ],
            );
          }),
    );
  }

  Widget doctorVisitTile(
    AssetGenImage image,
    String name,
    String designation,
    String date,
  ) {
    return [
      image.image(height: 50),
      [
        Styled.text(name).bold(),
        Styled.text(designation).fontSize(12).textColor(AppColors.primaryColor),
        Styled.text(date).fontSize(10).padding(all: 4).decorated(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(10),
            )
      ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      Styled.icon(Icons.arrow_forward)
          .padding(all: 6)
          .decorated(color: Colors.grey.shade300, shape: BoxShape.circle)
    ]
        .toRow(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        )
        .padding(
          all: 6,
        )
        .decorated(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        )
        .padding(vertical: 10);
  }
}
