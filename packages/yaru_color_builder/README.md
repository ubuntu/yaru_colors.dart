# yaru_color_builder

A builder extension for `yaru_color_generator` for generating Yaru colors at
build time.

```yaml
dependencies:
  yaru_color_generator:

dev_dependencies:
  build_runner:
  yaru_color_builder:
```

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
