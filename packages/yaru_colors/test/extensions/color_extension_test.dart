import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:yaru_colors/src/extensions/color_extension.dart';

final Matcher throwsAssertionError = throwsA(isA<AssertionError>());

void main() {
  group('- Color.darken() test -', () {
    test('With out of range amount', () {
      expect(() => const Color(0xffffffff).darken(-0.1), throwsAssertionError);
      expect(() => const Color(0xffffffff).darken(1.1), throwsAssertionError);
    });
    test('With clamped amount', () {
      expect(const Color(0xff000000).darken(1), const Color(0xff000000));
    });
    test('With medium amount (desaturated)', () {
      expect(const Color(0xffffffff).darken(.5), const Color(0xff808080));
    });
    test('With medium amount (red)', () {
      expect(const Color(0xffff0000).darken(.5), const Color(0xff800000));
    });
    test('With medium amount (green)', () {
      expect(const Color(0xff00ff00).darken(.5), const Color(0xff008000));
    });
    test('With medium amount (blue)', () {
      expect(const Color(0xff0000ff).darken(.5), const Color(0xff000080));
    });
  });
  group('- Color.lighten() test -', () {
    test('With out of range amount', () {
      expect(() => const Color(0xff000000).lighten(-0.1), throwsAssertionError);
      expect(() => const Color(0xff000000).lighten(1.1), throwsAssertionError);
    });
    test('With clamped amount', () {
      expect(const Color(0xffffffff).lighten(1), const Color(0xffffffff));
    });
    test('With medium amount (desaturated)', () {
      expect(const Color(0xff000000).lighten(.5), const Color(0xff808080));
    });
    test('With medium amount (red)', () {
      expect(const Color(0xffff0000).lighten(.5), const Color(0xffff8080));
    });
    test('With medium amount (green)', () {
      expect(const Color(0xff00ff00).lighten(.5), const Color(0xff80ff80));
    });
    test('With medium amount (blue)', () {
      expect(const Color(0xff0000ff).lighten(.5), const Color(0xff8080ff));
    });
  });
}
