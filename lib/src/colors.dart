import 'package:flutter/material.dart';
import 'package:yaru_color_generator/yaru_color_generator.dart';

part 'colors.g.dart';

/// Available Yaru color palettes.
class YaruColors {
  YaruColors._();

  /// Generates a Yaru color palette from the specicied [primary] color value.
  static MaterialColor generate(int primary) {
    final color = generateYaruColor(primary);
    return MaterialColor(color.primary, {
      for (final shade in color.shades) shade: Color(color[shade]!),
    });
  }

  /// Ubuntu Orange
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/orange.png)
  @GeneratedYaruColor(0xFFE95420)
  static const MaterialColor orange = _$YaruColors.orange;

  /// Warm Grey
  ///
  /// For balance. The addition of warm grey softens the combination of orange
  /// and aubergine and provides a bridge between the two.
  ///
  /// Warm grey can be used for; backgrounds, graphics, dot patterns, charts and
  /// diagrams. It can also be used for large size text.
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/warmGrey.png)
  @GeneratedYaruColor(0xFFAEA79F)
  static const MaterialColor warmGrey = _$YaruColors.warmGrey;

  /// Cool Grey
  ///
  /// For typography, particularly body copy. Black can be quite harsh in
  /// combination with aubergine, but grey delivers more balance while still
  /// being legible.
  ///
  /// Cool grey can also be used within charts and diagrams.
  static const Color coolGrey = Color(0xFF333333);

  /// Text Grey
  ///
  /// Text grey is used for small size headings, sub-headings and body copy text
  /// only.
  static const Color textGrey = Color(0xFF111111);

  /// Error
  static const Color error = Color(0xFFff0000);

  /// Warning
  static const Color warning = Color(0xFFf99b11);

  /// Success
  static const Color success = Color(0xFF0e8420);

  /// Porcelain
  static const Color porcelain = Color(0xFFFAFAFA);

  /// Inkstone
  static const Color inkstone = Color(0xFF3B3B3B);

  /// Jet
  static const Color jet = Color(0xFF2B2B2B);

  /// Light title bar
  static const Color titleBarLight = Color(0xFFEBEBEB);

  /// Dark title bar
  static const Color titleBarDark = Color(0xFF303030);

  /// Olive
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/olive.png)
  @GeneratedYaruColor(0xFF4B8501)
  static const MaterialColor olive = _$YaruColors.olive;

  /// Bark
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/bark.png)
  @GeneratedYaruColor(0xFF787859)
  static const MaterialColor bark = _$YaruColors.bark;

  /// Sage
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/sage.png)
  @GeneratedYaruColor(0xFF657B69)
  static const MaterialColor sage = _$YaruColors.sage;

  /// Prussian Green
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/prussianGreen.png)
  @GeneratedYaruColor(0xFF308280)
  static const MaterialColor prussianGreen = _$YaruColors.prussianGreen;

  /// Viridian
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/viridian.png)
  @GeneratedYaruColor(0xFF03875B)
  static const MaterialColor viridian = _$YaruColors.viridian;

  /// Purple
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/purple.png)
  @GeneratedYaruColor(0xFF7764D8)
  static const MaterialColor purple = _$YaruColors.purple;

  /// Red
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/red.png)
  @GeneratedYaruColor(0xFFDA3450)
  static const MaterialColor red = _$YaruColors.red;

  /// Blue
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/blue.png)
  @GeneratedYaruColor(0xFF0073E5)
  static const MaterialColor blue = _$YaruColors.blue;

  /// Magenta
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/magenta.png)
  @GeneratedYaruColor(0xFFB34CB3)
  static const MaterialColor magenta = _$YaruColors.magenta;

  /// Kubuntu Blue
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/kubuntuBlue.png)
  @GeneratedYaruColor(0xFF0079C1)
  static const MaterialColor kubuntuBlue = _$YaruColors.kubuntuBlue;

  /// Lubuntu Blue
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/lubuntuBlue.png)
  @GeneratedYaruColor(0xFF0068C8)
  static const MaterialColor lubuntuBlue = _$YaruColors.lubuntuBlue;

  /// Ubuntu Budgie Blue
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/ubuntuBudgieBlue.png)
  @GeneratedYaruColor(0xFF2196F3)
  static const MaterialColor ubuntuBudgieBlue = _$YaruColors.ubuntuBudgieBlue;

  /// Ubuntu Butterfly Pink
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/ubuntuButterflyPink.png)
  @GeneratedYaruColor(0xFFFF135B)
  static const MaterialColor ubuntuButterflyPink =
      _$YaruColors.ubuntuButterflyPink;

  /// Ubuntu Cinnamon Brown
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/ubuntuCinnamonBrown.png)
  @GeneratedYaruColor(0xFFDD682A)
  static const MaterialColor ubuntuCinnamonBrown =
      _$YaruColors.ubuntuCinnamonBrown;

  /// Ubuntu MATE Green
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/ubuntuMateGreen.png)
  @GeneratedYaruColor(0xFF73AF59)
  static const MaterialColor ubuntuMateGreen = _$YaruColors.ubuntuMateGreen;

  /// Ubuntu Studio Blue
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/ubuntuStudioBlue.png)
  @GeneratedYaruColor(0xFF009BF9)
  static const MaterialColor ubuntuStudioBlue = _$YaruColors.ubuntuStudioBlue;

  /// Ubuntu Unity Purple
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/ubuntuUnityPurple.png)
  @GeneratedYaruColor(0xFF9005D5)
  static const MaterialColor ubuntuUnityPurple = _$YaruColors.ubuntuUnityPurple;

  /// Xubuntu Blue
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/main/doc/images/xubuntuBlue.png)
  @GeneratedYaruColor(0xFF0044AA)
  static const MaterialColor xubuntuBlue = _$YaruColors.xubuntuBlue;
}
