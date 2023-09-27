import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReportGeneration extends HookConsumerWidget {
  const ReportGeneration({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("প্রতিবেদন তৈরি"),
      ),
      body: const Text("ReportGeneration"),
    );
  }
}
