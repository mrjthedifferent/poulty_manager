import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/feature/auth/data/local/user_repository.dart';
import '../core/exceptions/async_error.dart';
import '../core/exceptions/error_logger.dart';
import '../feature/auth/data/local/local_user.dart';

Future<ProviderContainer> preProcess() async {
  // init hive
  await Hive.initFlutter();

  final localUserRepo = await UserLocalRepository.ready();

  // make container Provider Override

  final container = ProviderContainer(overrides: [
    localUserRepositoryProvider.overrideWithValue(localUserRepo),
  ], observers: [
    AsyncErrorLogger(),
    Logger()
  ]);
  final errorLogger = container.read(errorLoggerProvider);
  registerErrorHandlers(errorLogger);
  return container;
}

void registerErrorHandlers(ErrorLogger errorLogger) {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    errorLogger.logError(details.exception, details.stack);
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    errorLogger.logError(error, stack);
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('An error occurred'),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }
}
