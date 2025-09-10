import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:whisperfire/ui/pages/lessons/lessons_page.dart';
import 'package:whisperfire/ui/pages/mentors/mentors_page.dart';
import 'package:whisperfire/ui/pages/analyze/analyze_page.dart';

Future<void> _capturePage(
  WidgetTester tester, {
  required Widget page,
  required String outPath,
  required Size logicalSize,
}) async {
  await tester.binding.setSurfaceSize(logicalSize);

  final repaintKey = GlobalKey();
  await tester.pumpWidget(
    RepaintBoundary(
      key: repaintKey,
      child: ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: page,
        ),
      ),
    ),
  );

  await tester.pumpAndSettle(const Duration(milliseconds: 700));

  final boundary = tester.renderObject(find.byKey(repaintKey)) as RenderRepaintBoundary;
  final ui.Image image = await boundary.toImage(pixelRatio: 1.0);
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  final bytes = byteData!.buffer.asUint8List();

  final file = File(outPath);
  await file.parent.create(recursive: true);
  await file.writeAsBytes(bytes);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Generate store screenshots for Lessons, Mentors, Analyze', (tester) async {
    const size67 = Size(1290, 2796);
    const size55 = Size(1242, 2208);

    await _capturePage(
      tester,
      page: const LessonsPage(),
      outPath: 'assets/store/iphone67_lessons.png',
      logicalSize: size67,
    );
    await _capturePage(
      tester,
      page: const LessonsPage(),
      outPath: 'assets/store/iphone55_lessons.png',
      logicalSize: size55,
    );

    await _capturePage(
      tester,
      page: const MentorsPage(),
      outPath: 'assets/store/iphone67_mentors.png',
      logicalSize: size67,
    );
    await _capturePage(
      tester,
      page: const MentorsPage(),
      outPath: 'assets/store/iphone55_mentors.png',
      logicalSize: size55,
    );

    await _capturePage(
      tester,
      page: const AnalyzePage(),
      outPath: 'assets/store/iphone67_analyze.png',
      logicalSize: size67,
    );
    await _capturePage(
      tester,
      page: const AnalyzePage(),
      outPath: 'assets/store/iphone55_analyze.png',
      logicalSize: size55,
    );
  });
} 