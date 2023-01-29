import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:yaru_colors/src/extensions/color_extension.dart';

final Matcher throwsAssertionError = throwsA(isA<AssertionError>());

void main() {
  group('Color.darken() test -', () {
    test('With out of range amount', () {
      expect(() => const Color(0xffffffff).darken(-0.1), throwsAssertionError);
      expect(() => const Color(0xffffffff).darken(1.1), throwsAssertionError);
    });
    test('With clamped amount', () {
      expect(
        const Color(0xff808080).darken(1),
        const Color(0xff000000),
      );
      expect(
        const Color(0xff808080).darken(1, relative: true),
        const Color(0xff000000),
      );
    });
    test('With medium amount (orange)', () {
      expect(
        const Color(0xffe95622).darken(.5),
        const Color(0xff0b0401),
      );
      expect(
        const Color(0xffe95622).darken(.5, relative: true),
        const Color(0xff79290c),
      );
    });
    test('With medium amount (desaturated)', () {
      expect(
        const Color(0xffffffff).darken(.5),
        const Color(0xff808080),
      );
      expect(
        const Color(0xffffffff).darken(.5, relative: true),
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
        const Color(0xff808080).lighten(1),
        const Color(0xffffffff),
      );
      expect(
        const Color(0xff808080).lighten(1, relative: true),
        const Color(0xffffffff),
      );
    });
    test('With medium amount (orange)', () {
      expect(
        const Color(0xffe95622).lighten(.5),
        const Color(0xffffffff),
      );
      expect(
        const Color(0xffe95622).lighten(.5, relative: true),
        const Color(0xfff4ab90),
      );
    });
    test('With medium amount (desaturated)', () {
      expect(
        const Color(0xff000000).lighten(.5),
        const Color(0xff808080),
      );
      expect(
        const Color(0xff000000).lighten(.5, relative: true),
        const Color(0xff808080),
      );
    });
  });
}
