import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:yaru_colors/src/yaru_color_extension.dart';

final Matcher throwsAssertionError = throwsA(isA<AssertionError>());

void main() {
  group('Color.darken() test -', () {
    test('With out of range amount', () {
      expect(() => const Color(0xffffffff).darken(-0.1), throwsAssertionError);
      expect(() => const Color(0xffffffff).darken(1.1), throwsAssertionError);
    });
    test('With clamped amount', () {
      expect(
        const Color(0xff808080).darken(1.0),
        const Color(0xff000000),
      );
    });
    test('With medium amount (orange)', () {
      expect(
        const Color(0xffe95622).darken(0.5),
        const Color(0xff79290c),
      );
    });
    test('With medium amount (desaturated)', () {
      expect(
        const Color(0xffffffff).darken(0.5),
        const Color(0xff808080),
      );
    });
  });
  group('- Color.lighten() test -', () {
    test('With out of range amount', () {
      expect(() => const Color(0xff000000).lighten(-0.1), throwsAssertionError);
      expect(() => const Color(0xff000000).lighten(1.1), throwsAssertionError);
    });
    test('With clamped amount', () {
      expect(
        const Color(0xff808080).lighten(1.0),
        const Color(0xffffffff),
      );
    });
    test('With medium amount (orange)', () {
      expect(
        const Color(0xffe95622).lighten(0.5),
        const Color(0xfff4ab90),
      );
    });
    test('With medium amount (desaturated)', () {
      expect(
        const Color(0xff000000).lighten(0.5),
        const Color(0xff808080),
      );
    });
  });
  group('Color.appendLightness() test -', () {
    test('With out of range amount', () {
      expect(() => const Color(0xffffffff).appendLightness(-1.1),
          throwsAssertionError);
      expect(() => const Color(0xffffffff).darken(1.1), throwsAssertionError);
    });
    test('With clamped amount', () {
      expect(
        const Color(0xff808080).appendLightness(1.0),
        const Color(0xffffffff),
      );
      expect(
        const Color(0xff808080).appendLightness(-1.0),
        const Color(0xff000000),
      );
    });
    test('With medium amount (orange)', () {
      expect(
        const Color(0xffe95622).appendLightness(0.5),
        const Color(0xffffffff),
      );
      expect(
        const Color(0xffe95622).appendLightness(-0.5),
        const Color(0xff0b0401),
      );
    });
    test('With medium amount (desaturated)', () {
      expect(
        const Color(0xff000000).appendLightness(0.5),
        const Color(0xff808080),
      );
      expect(
        const Color(0xffffffff).appendLightness(-0.5),
        const Color(0xff808080),
      );
    });
  });
}
