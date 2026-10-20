import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumquick/core/di/dependency_injection.dart';
import 'package:yumquick/main.dart';

void main() {
  setUpAll(setupGetIt);

  testWidgets('login screen renders', (tester) async {
    tester.view.physicalSize = const Size(393, 852);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.text('Log In'), findsNWidgets(2));
    expect(find.text('Welcome'), findsOneWidget);
  });
}
