// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  group('test', () {
    testWidgets(
      'test',
      (WidgetTester tester) async {
        await app.main();
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('Init')));
        await tester.pumpAndSettle();
        await Future.delayed(const Duration(minutes: 5));
      },
    );
  });
}
