// https://observablehq.com/@mateh/palette
import 'dart:math' as math;

import 'color.dart';

const _kLightnessTable = {
  50: 2.048875457,
  100: 5.124792061,
  200: 8.751659557,
  300: 12.07628774,
  400: 13.91449542,
  500: 15.92738893,
  600: 15.46585818,
  700: 15.09779227,
  800: 15.13738673,
  900: 15.09818372
};

const _kChromaTable = {
  50: 1.762442714,
  100: 4.213532634,
  200: 7.395827458,
  300: 11.07174158,
  400: 13.89634504,
  500: 16.37591477,
  600: 16.27071136,
  700: 16.54160806,
  800: 17.35916727,
  900: 19.88410864
};

double lookupLightness(int from, int to) {
  return _kLightnessTable[from]! / _kLightnessTable[to]!;
}

double lookupChroma(int from, int to) {
  return math.min(_kChromaTable[from]! / _kChromaTable[to]!, 1.25);
}

extension LabColorX on LabColor {
  double distanceTo(LabColor other) {
    final avgL = (other.l + l) / 2;
    var currentLabDist = math.sqrt(math.pow(other.a, 2) + math.pow(other.b, 2));
    var targetLabDist = math.sqrt(math.pow(a, 2) + math.pow(b, 2));
    var labDist = (currentLabDist + targetLabDist) / 2;
    labDist = 0.5 *
        (1 -
            math.sqrt(math.pow(labDist, 7) /
                (math.pow(labDist, 7) + math.pow(25, 7))));
    var currentRefA = other.a * (1 + labDist);
    var targetRefA = a * (1 + labDist);
    var currentRefDist =
        math.sqrt(math.pow(currentRefA, 2) + math.pow(other.b, 2));
    var targetRefDist = math.sqrt(math.pow(targetRefA, 2) + math.pow(b, 2));
    labDist = targetRefDist - currentRefDist;
    final refDist = (currentRefDist + targetRefDist) / 2;
    double transform(double a, double b) {
      if (1e-4 > a.abs() && 1e-4 > b.abs()) return 0;
      a = (180 * math.atan2(a, b)) / math.pi;
      return 0 <= a ? a : a + 360;
    }

    currentRefA = transform(other.b, currentRefA);
    targetRefA = transform(b, targetRefA);
    currentRefDist = 2 *
        math.sqrt(currentRefDist * targetRefDist) *
        math.sin((((1e-4 > currentLabDist.abs() || 1e-4 > targetLabDist.abs()
                        ? 0
                        : 180 >= (targetRefA - currentRefA).abs()
                            ? targetRefA - currentRefA
                            : targetRefA <= currentRefA
                                ? targetRefA - currentRefA + 360
                                : targetRefA - currentRefA - 360) /
                    2) *
                math.pi) /
            180);
    currentLabDist = 1e-4 > currentLabDist.abs() || 1e-4 > targetLabDist.abs()
        ? 0
        : 180 >= (targetRefA - currentRefA).abs()
            ? (currentRefA + targetRefA) / 2
            : 360 > currentRefA + targetRefA
                ? (currentRefA + targetRefA + 360) / 2
                : (currentRefA + targetRefA - 360) / 2;
    targetLabDist = 1 + 0.045 * refDist;
    targetRefDist = 1 +
        0.015 *
            refDist *
            (1 -
                0.17 * math.cos(((currentLabDist - 30) * math.pi) / 180) +
                0.24 * math.cos((2 * currentLabDist * math.pi) / 180) +
                0.32 * math.cos(((3 * currentLabDist + 6) * math.pi) / 180) -
                0.2 * math.cos(((4 * currentLabDist - 63) * math.pi) / 180));
    return math.sqrt(math.pow(
            (l - other.l) /
                (1 +
                    (0.015 * math.pow(avgL - 50, 2)) /
                        math.sqrt(20 + math.pow(avgL - 50, 2))),
            2) +
        math.pow(labDist / (1 * targetLabDist), 2) +
        math.pow(currentRefDist / (1 * targetRefDist), 2) +
        (labDist / (1 * targetLabDist)) *
            math.sqrt(math.pow(refDist, 7) /
                (math.pow(refDist, 7) + math.pow(25, 7))) *
            math.sin((60 *
                    math.exp(-math.pow((currentLabDist - 275) / 25, 2)) *
                    math.pi) /
                180) *
            -2 *
            (currentRefDist / (1 * targetRefDist)));
  }

  HclColor toHcl() {
    return HclColor(
      ((180 * math.atan2(b, a)) / math.pi + 360) % 360,
      math.sqrt(math.pow(a, 2) + math.pow(b, 2)),
      l,
      alpha,
    );
  }

  RgbColor toRgb() {
    var diffL = (l + 16) / 116;

    num getRatio(num a) {
      final b = 6 / 29, c = 3 * math.pow(b, 2);
      return a > b ? math.pow(a, 3) : c * (a - 4 / 29);
    }

    final scalar = 0.95047 * getRatio(diffL + a / 500);
    final newL = 1 * getRatio(diffL);
    diffL = 1.08883 * getRatio(diffL - b / 200);

    double transform(num a) {
      return 0.0031308 >= a ? 12.92 * a : 1.055 * math.pow(a, 1 / 2.4) - 0.055;
    }

    return RgbColor(
      transform(3.2404542 * scalar + -1.5371385 * newL + -0.4985314 * diffL)
          .clamp(0, 1),
      transform(-0.969266 * scalar + 1.8760108 * newL + 0.041556 * diffL)
          .clamp(0, 1),
      transform(0.0556434 * scalar + -0.2040259 * newL + 1.0572252 * diffL)
          .clamp(0, 1),
    );
  }
}

extension RgbColorX on RgbColor {
  HclColor toHcl() => toLab().toHcl();

  LabColor toLab() {
    num transform(num n) {
      return 0.04045 >= n ? n / 12.92 : math.pow((n + 0.055) / 1.055, 2.4);
    }

    num getRatio(num n) {
      final m = 6 / 29, c = 1 / (3 * math.pow(m, 2));
      return n > math.pow(m, 3) ? math.pow(n, 1 / 3) : c * n + 4 / 29;
    }

    final x = transform(r),
        y = transform(g),
        z = transform(b),
        w = 0.2126729 * x + 0.7151522 * y + 0.072175 * z;
    return LabColor(
      116 * getRatio(w) - 16,
      500.0 *
          (getRatio((0.4124564 * x + 0.3575761 * y + 0.1804375 * z) / 0.95047) -
              getRatio(w)),
      200.0 *
          (getRatio(w) -
              getRatio(
                  (0.0193339 * x + 0.119192 * y + 0.9503041 * z) / 1.08883)),
      alpha,
    );
  }
}

extension HclColorX on HclColor {
  HclColor deltaTo(HclColor other) {
    return HclColor(h - other.h, c - other.c, l - other.l);
  }
}
