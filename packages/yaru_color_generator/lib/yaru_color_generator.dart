/// Generates full Yaru Material color palettes from singular primary color values.
library yaru_color_generator;

import 'src/generate.dart';
import 'src/material.dart';
import 'src/palette.dart';

export 'src/palette.dart';

/// Generates a full Yaru Material color palette from the specicied [primary]
/// color value.
Palette generateYaruColor(int primary) {
  return generateColor(primary, MaterialColors.values);
}

/// Annotation for generating Yaru colors at build time with the
/// `yaru_color_builder` package.
class GeneratedYaruColor {
  const GeneratedYaruColor(this.primary);
  final int primary;
}
