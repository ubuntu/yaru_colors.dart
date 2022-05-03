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

  /// Orange
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/screenshots/packages/yaru_colors/example/doc/images/orange.png)
  @GeneratedYaruColor(0xFFE95622)
  static const MaterialColor orange = _$YaruColors.orange;

  /// Warm Grey
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/screenshots/packages/yaru_colors/example/doc/images/warmGrey.png)
  @GeneratedYaruColor(0xFFAEA79F)
  static const MaterialColor warmGrey = _$YaruColors.warmGrey;

  static const Color coolGrey = Color(0xFF333333);
  static const Color textGrey = Color(0xFF111111);
  static const Color red = Color(0xFFff0000);
  static const Color yellow = Color(0xFFf99b11);
  static const Color green = Color(0xFF0e8420);
  static const Color disabledGreyDark = Color(0xFF535353);
  static const Color porcelain = Color(0xFFFAFAFA);
  static const Color inkstone = Color(0xFF3B3B3B);
  static const Color jet = Color(0xFF2B2B2B);

  /// Olive
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/screenshots/packages/yaru_colors/example/doc/images/olive.png)
  @GeneratedYaruColor(0xFF4B8501)
  static const MaterialColor olive = _$YaruColors.olive;

  /// Bark
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/screenshots/packages/yaru_colors/example/doc/images/bark.png)
  @GeneratedYaruColor(0xFF787859)
  static const MaterialColor bark = _$YaruColors.bark;

  /// Sage
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/screenshots/packages/yaru_colors/example/doc/images/sage.png)
  @GeneratedYaruColor(0xFF657B69)
  static const MaterialColor sage = _$YaruColors.sage;

  /// Prussian Green
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/screenshots/packages/yaru_colors/example/doc/images/prussianGreen.png)
  @GeneratedYaruColor(0xFF308280)
  static const MaterialColor prussianGreen = _$YaruColors.prussianGreen;

  /// Viridian
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/screenshots/packages/yaru_colors/example/doc/images/viridian.png)
  @GeneratedYaruColor(0xFF03875B)
  static const MaterialColor viridian = _$YaruColors.viridian;

  /// Purple
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/screenshots/packages/yaru_colors/example/doc/images/purple.png)
  @GeneratedYaruColor(0xFF8856EB)
  static const MaterialColor purple = _$YaruColors.purple;

  /// Light Red
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/screenshots/packages/yaru_colors/example/doc/images/lightRed.png)
  @GeneratedYaruColor(0xFFE61D34)
  static const MaterialColor lightRed = _$YaruColors.lightRed;

  /// Blue
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/screenshots/packages/yaru_colors/example/doc/images/blue.png)
  @GeneratedYaruColor(0xFF0073E5)
  static const MaterialColor blue = _$YaruColors.blue;

  /// Magenta
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/screenshots/packages/yaru_colors/example/doc/images/magenta.png)
  @GeneratedYaruColor(0xFFBC33DB)
  static const MaterialColor magenta = _$YaruColors.magenta;

  /// Kubuntu Blue
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/screenshots/packages/yaru_colors/example/doc/images/kubuntuBlue.png)
  @GeneratedYaruColor(0xFF0079C1)
  static const MaterialColor kubuntuBlue = _$YaruColors.kubuntuBlue;

  /// Lubuntu Blue
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/screenshots/packages/yaru_colors/example/doc/images/lubuntuBlue.png)
  @GeneratedYaruColor(0xFF0068C8)
  static const MaterialColor lubuntuBlue = _$YaruColors.lubuntuBlue;

  /// Ubuntu Budgie Blue
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/screenshots/packages/yaru_colors/example/doc/images/ubuntuBudgieBlue.png)
  @GeneratedYaruColor(0xFF2196F3)
  static const MaterialColor ubuntuBudgieBlue = _$YaruColors.ubuntuBudgieBlue;

  /// Ubuntu MATE Green
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/screenshots/packages/yaru_colors/example/doc/images/ubuntuMateGreen.png)
  @GeneratedYaruColor(0xFF73AF59)
  static const MaterialColor ubuntuMateGreen = _$YaruColors.ubuntuMateGreen;

  /// Ubuntu Studio Blue
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/screenshots/packages/yaru_colors/example/doc/images/ubuntuStudioBlue.png)
  @GeneratedYaruColor(0xFF009BF9)
  static const MaterialColor ubuntuStudioBlue = _$YaruColors.ubuntuStudioBlue;

  /// Xubuntu Blue
  ///
  /// ![](https://raw.githubusercontent.com/ubuntu/yaru_colors.dart/screenshots/packages/yaru_colors/example/doc/images/xubuntuBlue.png)
  @GeneratedYaruColor(0xFF0044AA)
  static const MaterialColor xubuntuBlue = _$YaruColors.xubuntuBlue;
}
