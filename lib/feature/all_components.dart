import 'package:flutter/material.dart';
import 'package:poulty_manager/core/Layout/extention.dart';
import 'package:styled_widget/styled_widget.dart';

class AllComponents extends StatelessWidget {
  const AllComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    page({required Widget child}) => Styled.widget(child: child)
        .padding(vertical: 30, horizontal: 20)
        .constrained(minHeight: MediaQuery.of(context).size.height - (2 * 30))
        .scrollable()
        .safeArea();

    return const Text("ALL COMPONENTS").wrapLayout();
  }
}
