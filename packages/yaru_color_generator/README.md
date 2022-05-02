# yaru_color_generator

Generates full Yaru Material color palettes from singular primary color values.

```yaml
dependencies:
  yaru_color_generator:
```

```dart
final color = generateYaruColor(0xFFE95420);
print(color); // {0: ..., 50: ..., 100: ..., ..., 900: ...}
```

References:
- https://material.io/inline-tools/color/
- https://observablehq.com/@mateh/palette
- https://github.com/Ignigena/material-color-tool/
