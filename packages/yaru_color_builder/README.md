# Yaru Color Builder

[![pub](https://img.shields.io/pub/v/yaru_color_builder.svg)](https://pub.dev/packages/yaru_color_builder)

A builder extension to [yaru_color_generator](https://pub.dev/packages/yaru_color_generator)
for generating Yaru colors at build time.

```dart
// my_colors.dart
import 'package:yaru_color_generator/yaru_color_generator.dart';

part 'my_colors.g.dart';

class MyColors {
  @GeneratedYaruColor(0xFFFF0000)
  static const MaterialColor red = _$MyColors.red;

  @GeneratedYaruColor(0xFF00FF00)
  static const MaterialColor green = _$MyColors.green;

  @GeneratedYaruColor(0xFF0000FF)
  static const MaterialColor blue = _$MyColors.blue;
}
```

# Usage

To use this package, add `yaru_color_builder` and `build_runner` as
[dev_dependency in your pubspec.yaml file](https://docs.flutter.dev/development/packages-and-plugins/using-packages).
