import 'package:flutter/material.dart';
import 'package:poulty_manager/feature/batch/presentation/functions/utils.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/Layout/extension.dart';

class MedicineDetails extends StatelessWidget {
  const MedicineDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      titleWithBackArrow(
        "রেনেমাইসিন",
        "",
        trailing: Styled.widget(
          child: const Icon(Icons.edit),
        ).gestures(onTap: () {}),
      )
    ].toColumn().parent(page);
  }
}
