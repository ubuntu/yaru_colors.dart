import 'package:flutter/widgets.dart';

/// Set of useful methods when working with [Color]
extension ColorExtension on Color {
  /// Makes the color lighter by the given [amount].
  /// [amount] value must be clamped between 0.0 and 1.0
  ///
  /// If [relative] is true, [amount] will be relatively based on the color luminosity,
  /// if false, [amount] will simply be append to color luminosity.
  /// For example, on a color with 0.5 of luminosity, and an [amount] of 0.5,
  /// the resulting lighter color will have a luminosity of:
  ///   - relative: 0.75
  ///   - absolute: 1.0
  Color lighten(double amount, {bool relative = false}) {
    return _lightness(amount, relative, true);
  }

  /// Makes the color darker by the given [amount].
  /// [amount] value must be clamped between 0.0 and 1.0
  ///
  /// If [relative] is true, [amount] will be relatively based on the color luminosity,
  /// if false, [amount] will simply be subtracted to color luminosity.
  /// For example, on a color with 0.5 of luminosity, and an [amount] of 0.5,
  /// the resulting darker color will have a luminosity of:
  ///   - relative: 0.25
  ///   - absolute: 0.0
  Color darken(double amount, {bool relative = false}) {
    return _lightness(amount, relative, false);
  }

  Color _lightness(double amount, bool relative, bool lighten) {
    assert(amount >= 0 && amount <= 1);

    final hslColor = HSLColor.fromColor(this);
    amount = lighten
        ? relative
            ? (1 - hslColor.lightness) * amount
            : amount
        : relative
            ? hslColor.lightness * -amount
            : -amount;

    return hslColor
        .withLightness((hslColor.lightness + amount).clamp(0.0, 1.0))
        // A pure dark color have saturation level at 1.0, which results in red when lighten.
        // So we reset this value to 0.0, so the result is desaturated:
        .withSaturation(hslColor.lightness == 0 ? 0 : hslColor.saturation)
        .toColor();
  }
}
