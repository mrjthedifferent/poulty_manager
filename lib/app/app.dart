import 'package:flutter/material.dart';

import '../config/config.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Poultry Manager',
      theme: kBaseThemeData,
      routerConfig: baseRouter,
    );
  }
}
