import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/index.dart';
import 'app/pre_process.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = await preProcess();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const App(),
    ),
  );
}
