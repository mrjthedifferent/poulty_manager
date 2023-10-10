import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poulty_manager/core/Layout/widget/with_app_bar.dart';
import 'package:poulty_manager/core/hooks/request/use_http_request.dart';
import 'package:styled_widget/styled_widget.dart';

import '/config/config.dart';
import '/feature/batch/presentation/functions/utils.dart';
import '/gen/assets.gen.dart';
import '../../../../config/constant/constant.dart';
import '../../../../core/client/api_url.dart';

class DoctorVisitShow extends HookConsumerWidget {
  const DoctorVisitShow(this.batchId, {super.key});
  final String batchId;

  static fetchDoctorVisitProvider(String batchId) =>
      makeAutoHttpRequestProvider(
        RequestOptions(
            path: ApiEndpoints.poultryBatchDoctorVisit,
            queryParameters: {"poultry_batch_id": batchId},
            method: "GET"),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var fetchData = ref.watch(fetchDoctorVisitProvider(batchId));

    final doctorVisit = useAutoRequest(fetchData);

    // ;
    return Scaffold(
      appBar: const BaseAppBar(),
      body: Stack(
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
            doctorVisit.when(
                data: (data) => Text(
                      data.data.toString(),
                    ),
                error: (e, s) => Text(e.toString()),
                loading: () => const CircularProgressIndicator())
            // AsyncValueWidget(
            //   value: doctorVisit,
            //   data: (data) {
            //     return SingleChildScrollView(
            //       child: Text(
            //         data.data!.length.toString(),
            //       ),
            //     );
            //     // if (data.isEmpty) {
            //     //   return const Center(
            //     //     child: Text("No data found"),
            //     //   );
            //     // }

            //     // return ListView.builder(
            //     //   shrinkWrap: true,
            //     //   primary: false,
            //     //   physics: const NeverScrollableScrollPhysics(),
            //     //   itemCount: data.length,
            //     //   itemBuilder: (context, index) {
            //     //     final doctor = data[index];
            //     //     return doctorVisitTile(
            //     //       Assets.images.doctor,
            //     //       doctor.doctorName ?? "",
            //     //       doctor.doctorDegree ?? "",
            //     //       doctor.doctorVisitDateFormatted ?? "",
            //     //     );
            //     //   },
            //     // );
            //   },
            // )

            // doctorVisitTile(Assets.images.doctor, "ডাঃ মোঃ আব্দুল কাদের",
            //     "প্রধান চিকিৎসক", "তারিখঃ ১ জানুয়ারি ২০২২"),
            // doctorVisitTile(Assets.images.doctor, "ডাঃ জাহাঙ্গীর কবির", "MBBS",
            //     "তারিখঃ ১ জানুয়ারি ২০২২"),
            // doctorVisitTile(Assets.images.doctor, "ডাঃ শেখ মুজিব", "প্রধান চিকিৎসক",
            //     "তারিখঃ ১ জানুয়ারি ২০২২"),
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
      ),
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
