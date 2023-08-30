import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/config/router/route_name.dart';

extension MakeLayout on Widget {
  Widget makeLayoutWithAppBar({required String title}) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: this,
      );
}

class MainComponent extends StatelessWidget {
  const MainComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.push(AppRouteName.component);
      },
      child: const Text('Go to AllComponents'),
    ).makeLayoutWithAppBar(title: "MainComponent");
  }
}
