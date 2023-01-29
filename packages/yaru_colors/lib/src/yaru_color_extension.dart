import 'package:flutter/widgets.dart';

/// Set of useful methods when working with [Color]
extension YaruColorExtension on Color {
  /// Makes the color lighter by the given [amount], relatively to the current color luminosity.
  /// [amount] value must be clamped between 0.0 and 1.0
  Color lighten(double amount) {
    assert(amount >= 0.0 && amount <= 1.0);
    return _lightness(amount, true);
  }

  /// Makes the color darker by the given [amount], relatively to the current color luminosity.
  /// [amount] value must be clamped between 0.0 and 1.0
  Color darken(double amount) {
    assert(amount >= 0.0 && amount <= 1.0);
    return _lightness(amount, false);
  }

  /// Appends the given [lightness] to the color.
  /// [lightness] value must be clamped between -1.0 and 1.0
  Color appendLightness(double lightness) {
    assert(lightness >= -1.0 && lightness <= 1.0);
    return _lightness(lightness, null);
  }

  Color _lightness(double amount, bool? lighten) {
    final hslColor = HSLColor.fromColor(this);

    switch (lighten) {
      case true:
        amount = (1 - hslColor.lightness) * amount;
        break;
      case false:
        amount = hslColor.lightness * -amount;
        break;
    }

    return hslColor
        .withLightness((hslColor.lightness + amount).clamp(0.0, 1.0))
        // A pure dark color have saturation level at 1.0, which results in red when lighten.
        // So we reset this value to 0.0, so the result is desaturated:
        .withSaturation(hslColor.lightness == 0.0 ? 0.0 : hslColor.saturation)
        .toColor();
  }
}
