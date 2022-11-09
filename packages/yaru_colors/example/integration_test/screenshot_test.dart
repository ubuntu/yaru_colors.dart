import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:package_config/package_config.dart';
import 'package:path/path.dart' as p;
import 'package:yaru_colors_example/main.dart' as app;

// NOTE: run `flutter test --update-goldens integration_test` to update screenshots

Future<void> main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('accents', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    const colors = [
      'orange',
      'olive',
      'bark',
      'sage',
      'prussianGreen',
      'viridian',
      'purple',
      'red',
      'blue',
      'magenta',
    ];

    for (final color in colors) {
      final swatch = find.byKey(Key('YaruColors.$color'), skipOffstage: false);
      await tester.ensureVisible(swatch);
      await tester.pump();
      await expectLater(swatch, matchesGoldenFile(await getImagePath(color)));
    }
  });

  testWidgets('flavors', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Flavor'));
    await tester.pumpAndSettle();

    const colors = [
      'kubuntuBlue',
      'lubuntuBlue',
      'ubuntuBudgieBlue',
      'ubuntuButterflyPink',
      'ubuntuMateGreen',
      'ubuntuStudioBlue',
      'xubuntuBlue',
    ];

    for (final color in colors) {
      final swatch = find.byKey(Key('YaruColors.$color'), skipOffstage: false);
      await tester.ensureVisible(swatch);
      await tester.pump();
      await expectLater(swatch, matchesGoldenFile(await getImagePath(color)));
    }
  });

  testWidgets('neutral', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Neutral'));
    await tester.pumpAndSettle();

    const colors = [
      'warmGrey',
    ];

    for (final color in colors) {
      final swatch = find.byKey(Key('YaruColors.$color'), skipOffstage: false);
      await tester.ensureVisible(swatch);
      await tester.pump();
      await expectLater(swatch, matchesGoldenFile(await getImagePath(color)));
    }
  });
}

// yaru_colors.dart/packages/yaru_colors/doc/images
Future<String> getImagePath(String name) async {
  final config = await findPackageConfig(Directory.current);
  final package = config?.packages.firstWhere((p) => p.name == 'yaru_colors');
  return p.join(package!.root.path, 'doc', 'images', '$name.png');
}
