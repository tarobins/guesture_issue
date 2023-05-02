
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gesture_issue/gesture_scroll_list.dart';



void testGestureScrollList(
    WidgetTester tester, bool addPanDownEventHandler) async {
  // Build our app and trigger a frame.
  await tester.pumpWidget(MaterialApp(
      home: Material(
          child: GestureScrollList(
    addPanDownEventHandler: addPanDownEventHandler,
  ))));

  // Verify that our counter starts at 0.
  var item1 = find.byKey(const ValueKey('key 1'));
  expect(item1, findsOneWidget);

  final itemHeight = tester.getSize(item1).height;

  // print('Before scroll top left: ${tester.getTopLeft(item1)}');
  // print('Item height: $itemHeight');

  await tester.drag(find.byType(GestureScrollList), Offset(0, -itemHeight));
  await tester.pumpAndSettle();

  expect(tester.getTopLeft(item1), Offset.zero);
}

void main() {
  testWidgets('With addPanDownEventHandler = false',
      (WidgetTester tester) async {
    testGestureScrollList(tester, false);
  });

  testWidgets('With addPanDownEventHandler = true',
      (WidgetTester tester) async {
    testGestureScrollList(tester, true);
  });
}
