import 'package:collection/collection.dart';

/// Color palette described as key-value pairs of shade levels and ARGB color values.
typedef Palette = Map<int, int>;

/// Palette extensions for color maps.
extension PaletteX on Palette {
  /// Returns the primary color value.
  int get primary => this[0]!;

  /// Returns the full list of shades: `[50, 100, 200, ..., 900]`.
  Iterable<int> get shades => keys.skip(1);

  /// Returns true if this palette equals the [other] palette.
  bool equals(Palette other) {
    final mapEquals = const MapEquality<int, int>().equals;
    return mapEquals(this, other);
  }
}
