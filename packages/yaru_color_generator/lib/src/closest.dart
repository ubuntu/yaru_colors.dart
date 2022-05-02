import 'dart:collection';

import 'color.dart';
import 'google.dart';
import 'palette.dart';

extension ClosestShade on Palette {
  double distanceTo(int shade, RgbColor other) {
    final lab1 = RgbColor.fromInt(this[shade]!).toLab();
    final lab2 = RgbColor.fromInt(other.toInt()).toLab();
    return lab1.distanceTo(lab2);
  }

  int findClosestShade(RgbColor color) {
    final tree = SplayTreeMap<int, int>.fromIterable(
      shades,
      value: (dynamic shade) => this[shade as int]!,
      compare: (shade1, shade2) {
        return distanceTo(shade1, color).compareTo(distanceTo(shade2, color));
      },
    );
    return tree.firstKey()!;
  }
}

extension ClosestPalette on List<Palette> {
  Palette findClosestPalette(RgbColor color) {
    final tree = SplayTreeMap<double, Palette>.fromIterable(
      this,
      key: (dynamic it) {
        final palette = it as Palette;
        final shade = palette.findClosestShade(color);
        return palette.distanceTo(shade, color);
      },
    );
    return tree.values.first;
  }
}
