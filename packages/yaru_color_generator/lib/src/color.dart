import 'dart:math' as math;

import 'package:meta/meta.dart';

// precision
final O = math.pow(2, -16);

@immutable
class LabColor {
  const LabColor(this.l, this.a, this.b, [this.alpha = 1]);

  final double l, a, b, alpha;

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LabColor &&
        (l - other.l).abs() < 1e-4 &&
        (a - other.a).abs() < 1e-4 &&
        (b - other.b).abs() < 1e-4 &&
        (alpha - other.alpha).abs() < O;
  }

  @override
  int get hashCode => Object.hash(l, a, b, alpha);

  @override
  String toString() => 'LabColor($l, $a, $b)';
}

@immutable
class RgbColor {
  const RgbColor(this.r, this.g, this.b, [this.alpha = 1]);

  factory RgbColor.fromInt(int argb) {
    return RgbColor(
      ((argb >> 16) & 0xff) / 255,
      ((argb >> 8) & 0xff) / 255,
      (argb & 0xff) / 255,
      ((argb >> 24) & 0xff) / 255,
    );
  }

  final double r, g, b, alpha;

  int toInt() {
    return (alpha * 255).round() << 24 |
        ((r * 255).round() << 16) |
        ((g * 255).round() << 8) |
        (b * 255).round();
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RgbColor &&
        (r - other.r).abs() < O &&
        (g - other.g).abs() < O &&
        (b - other.b).abs() < O &&
        (alpha - other.alpha).abs() < O;
  }

  @override
  int get hashCode => Object.hash(r, g, b, alpha);

  @override
  String toString() => 'RgbColor($r, $g, $b, $alpha)';
}

@immutable
class HclColor {
  const HclColor(this.h, this.c, this.l, [this.alpha = 1]);

  final double h, c, l, alpha;

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HclColor &&
        (h - other.h).abs() < 1e-4 &&
        (c - other.c).abs() < 1e-4 &&
        (l - other.l).abs() < 1e-4 &&
        (alpha - other.alpha).abs() < O;
  }

  @override
  int get hashCode => Object.hash(h, c, l, alpha);

  @override
  String toString() => 'HclColor($h, $c, $l, $alpha)';
}
