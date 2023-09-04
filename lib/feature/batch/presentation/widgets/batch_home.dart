import 'package:flutter/material.dart';
import 'package:poulty_manager/config/config.dart';
import 'package:styled_widget/styled_widget.dart';

class BatchHome extends StatelessWidget {
  const BatchHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        [
          [
            Styled.text('No').padding(horizontal: 4, vertical: 2),
            Styled.text('08').padding(horizontal: 4, vertical: 2).decorated(
                  color: AppColors.primaryColor,
                ),
          ].toColumn().decorated(
                border: Border.all(
                  color: AppColors.primaryColor,
                ),
              ),
          [
            Styled.text('Batch Name').padding(horizontal: 4, vertical: 2),
            Styled.text('Sonali Murgi')
                .padding(horizontal: 4, vertical: 2)
                .decorated(
                  color: AppColors.primaryColor,
                ),
          ].toColumn().decorated(
                border: Border.all(
                  color: AppColors.primaryColor,
                ),
              ),
          [
            Styled.text('Start Date').padding(horizontal: 4, vertical: 2),
            Styled.text('1 June 2022')
                .padding(horizontal: 4, vertical: 2)
                .decorated(
                  color: AppColors.primaryColor,
                ),
          ].toColumn().decorated(
                border: Border.all(
                  color: AppColors.primaryColor,
                ),
              ),
          [
            Styled.text('Batch ID').padding(horizontal: 4, vertical: 2),
            Styled.text('54210').decorated(
              color: AppColors.primaryColor,
            ),
          ]
              .toColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
              )
              .decorated(
                border: Border.all(
                  color: AppColors.primaryColor,
                ),
              ),
        ]
            .toRow(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            )
            .padding(all: 4)
      ],
    );
  }
}
