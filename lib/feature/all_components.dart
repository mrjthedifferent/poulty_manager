import 'package:flutter/material.dart';
import 'package:poulty_manager/config/theme/color.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllComponents'),
      ),
      body: [
        const Text(
          'User settings',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ).alignment(Alignment.center).padding(bottom: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryColor,
              width: 1,
            ),
            color: const Color(0xfffff2e4),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Center(
            child: Text(
              'সোনালী মুরগী',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ].toColumn().parent(page),
    );
  }
}
