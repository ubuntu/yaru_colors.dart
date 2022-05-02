import 'dart:math' as math;

import 'closest.dart';
import 'color.dart';
import 'google.dart';
import 'palette.dart';

Palette generateColor(int primary, List<Palette> reference) {
  final source = RgbColor.fromInt(primary);

  final closestPalette = reference.findClosestPalette(source);
  final closestShade = closestPalette.findClosestShade(source);
  final closestColor = RgbColor.fromInt(closestPalette[closestShade]!).toHcl();

  var maxL = 100.0;
  final shades = closestPalette.shades.toList();
  final delta = closestColor.deltaTo(source.toHcl());
  final grey = RgbColor.fromInt(closestPalette[shades[5]]!).toHcl().c < 30;

  final colors = shades.map((shade) {
    final color = RgbColor.fromInt(closestPalette[shade]!).toHcl();

    if (color == closestColor) {
      maxL = math.max(source.toHcl().l - 1.7, 0);
      return source.toInt();
    }

    final refL = lookupLightness(shade, closestShade);
    final refC = lookupChroma(shade, closestShade);

    final h = (color.h - delta.h + 360) % 360 * math.pi / 180;
    final c = math.max(0, grey ? color.c - delta.c : color.c - delta.c * refC);
    final l = (color.l - refL * delta.l).clamp(0.0, maxL);

    maxL = math.max(l - 1.7, 0);

    return LabColor(
      l,
      c * math.cos(h),
      c * math.sin(h),
      color.alpha,
    ).toRgb().toInt();
  }).toList();

  return {
    0: colors[shades.indexOf(closestShade)],
    for (var i = 0; i < shades.length; ++i) shades[i]: colors[i],
  };
}
