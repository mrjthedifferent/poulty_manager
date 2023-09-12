import 'package:flutter/material.dart';

import '../core/Layout/extension.dart';

class AllComponents extends StatelessWidget {
  const AllComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // page({required Widget child}) => Styled.widget(child: child)
    //     .padding(vertical: 30, horizontal: 20)
    //     .constrained(minHeight: MediaQuery.of(context).size.height - (2 * 30))
    //     .scrollable()
    //     .safeArea();

    return const Text("ALL COMPONENTS").wrapLayout();
  }
}
