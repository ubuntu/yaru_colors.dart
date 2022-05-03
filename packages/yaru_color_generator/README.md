# Yaru Color Generator

[![pub](https://img.shields.io/pub/v/yaru_color_generator.svg)](https://pub.dev/packages/yaru_color_generator)

This package generates full Material color palettes for Yaru from singular
primary color values using the same algorithm as the official
[Material color tool](https://material.io/inline-tools/color/).

```dart
final color = generateYaruColor(0xFFE95420);
print(color.primary);
print(color.shades);
print(color[500]);
```

**NOTE**: This is a low-level pure Dart package with no dependency on Flutter. See
[yaru_colors](https://pub.dev/packages/yaru_colors) for more convenient API for
Flutter.

# Usage

To use this package, add `yaru_color_generator` as a
[dependency in your pubspec.yaml file](https://docs.flutter.dev/development/packages-and-plugins/using-packages).

# References

- https://material.io/inline-tools/color/
- https://observablehq.com/@mateh/palette
