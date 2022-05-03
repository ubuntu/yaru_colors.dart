/// Generates full Material color palettes for Yaru from singular primary color
/// values using the same algorithm as the official
/// [Material color tool](https://material.io/inline-tools/color/).
///
/// **NOTE**: This is a low-level pure Dart package with no dependency on
/// Flutter. See [yaru_colors](https://pub.dev/packages/yaru_colors) for more
/// convenient API for Flutter.
library yaru_color_generator;

import 'src/generate.dart';
import 'src/material.dart';
import 'src/palette.dart';

export 'src/palette.dart';

/// Generates a Material color palette from the specified primary color value.
///
/// The returned palette contains the following shades: 50, 100, 200, 300, 400,
/// 500, 600, 700, 800, 900.
///
/// The algorithm may adjust the primary color to make it more suitable for the
/// palette. The final primary color is available through the primary property.
///
/// ```dart
/// final color = generateYaruColor(0xFFE95420);
/// print(color.primary);
/// print(color.shades);
/// print(color[500]);
/// ```
Palette generateYaruColor(int primary) {
  return generateColor(primary, MaterialColors.values);
}

/// Annotation for generating Yaru colors at build time with the
/// [yaru_color_builder](https://pub.dev/packages/yaru_color_builder) package.
class GeneratedYaruColor {
  const GeneratedYaruColor(this.primary);
  final int primary;
}
