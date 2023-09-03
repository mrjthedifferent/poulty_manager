import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poulty_manager/core/Layout/extention.dart';

class MainComponent extends StatelessWidget {
  const MainComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.go('/main');
      },
      child: const Text('Go to AllComponents'),
    ).wrapScaffold(onlyTitleText: 'Main Component');
  }
}
