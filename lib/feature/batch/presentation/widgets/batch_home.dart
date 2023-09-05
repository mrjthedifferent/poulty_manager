import 'package:flutter/material.dart';
import 'package:poulty_manager/config/config.dart';
import 'package:poulty_manager/feature/home/fragment.dart';
import 'package:poulty_manager/gen/assets.gen.dart';
import 'package:poulty_manager/interface/image_text.dart';
import 'package:styled_widget/styled_widget.dart';

import '/feature/batch/presentation/widgets/two_text_column.dart';

class BatchHome extends StatelessWidget {
  const BatchHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            [
              const TwoTextColumn(uppertext: "নং", lowerText: "08"),
              const TwoTextColumn(
                  uppertext: "ব্যাচের নামঃ", lowerText: "সোনালী মুরগী"),
              const TwoTextColumn(
                  uppertext: "শুরুর তারিখ", lowerText: "১ জুন ২০২২"),
              const TwoTextColumn(uppertext: "ব্যাচ ID", lowerText: "54721"),
            ]
                .toRow(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                )
                .constrained(minHeight: 40, maxHeight: 60),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                    child: [
                      const SizedBox(
                        width: 4,
                      ),
                      [
                        Styled.text("উৎপাদন ব্যায় (কেজি)").fontSize(10),
                        Styled.text("৪১৪.০২৪ টাক")
                            .fontSize(10)
                            .textColor(Colors.grey[500]),
                      ].toColumn(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center),
                      Assets.images.hen.image().expanded(),
                    ].toRow(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  );
                },
              ),
            ),
            secondGrid.grid(primary: false, shrinkWrap: true),
            [
              [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Styled.text("08"),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Styled.text("সোনালী মুরগী"),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Styled.text("১ জুন ২০২২"),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Styled.text("54721"),
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
            ].toColumn().padding(all: 6).card(color: Colors.white),
            const SizedBox(
              height: 20,
            ),
          ],

          // make a grid with show two item in a row with builder
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        )
      ],
    );
  }
}
