import 'package:flutter/widgets.dart';

/// Set of useful methods when working with [Color]
extension ColorExtension on Color {
  /// Makes the color lighter by the given [amount].
  /// [amount] value must be clamped between 0.0 and 1.0
  Color lighten(double amount) {
    return _compute(amount, true);
  }

  /// Makes the color darker by the given [amount].
  /// [amount] value must be clamped between 0.0 and 1.0
  Color darken(double amount) {
    return _compute(amount, false);
  }

  Color _compute(double amount, bool lighten) {
    assert(amount >= 0 && amount <= 1,
        'Amount ($amount) must be clamped between 0.0 and 1.0');

    final rgbAmount = (lighten ? amount : -amount) * 255;
    int append(int value) {
      return (value + rgbAmount).clamp(0, 255).ceil();
    }

    return Color.fromRGBO(
      append(red),
      append(green),
      append(blue),
      opacity,
    );
  }
}
