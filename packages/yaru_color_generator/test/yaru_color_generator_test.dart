import 'package:test/test.dart';
import 'package:yaru_color_generator/src/material.dart';
import 'package:yaru_color_generator/yaru_color_generator.dart';

void main() {
  // https://material.io/inline-tools/color/
  group('ubuntu', () {
    test('orange', () {
      expect(generateYaruColor(0xFFE95420).toHex(), {
        0: '#e95420',
        50: '#f9e9e7',
        100: '#fbccbc',
        200: '#f9ab91',
        300: '#f68a65',
        400: '#f57144',
        500: '#f45a24',
        600: '#e95420',
        700: '#db4d1b',
        800: '#cd4718',
        900: '#b43b11',
      });
    });

    test('light aubergine', () {
      expect(generateYaruColor(0xFF77216F).toHex(), {
        0: '#77216f',
        50: '#f2e4ee',
        100: '#dfbcd6',
        200: '#ca90bb',
        300: '#b465a0',
        400: '#a3478e',
        500: '#922c7c',
        600: '#872877',
        700: '#77216f',
        800: '#681c66',
        900: '#4e1556',
      });
    });

    test('mid aubergine', () {
      expect(generateYaruColor(0xFF5E2750).toHex(), {
        0: '#5e2750',
        50: '#f4e4ee',
        100: '#e5bbd7',
        200: '#d790bc',
        300: '#cc68a2',
        400: '#c54c8e',
        500: '#c1347a',
        600: '#b03274',
        700: '#9a306b',
        800: '#842d62',
        900: '#5e2750',
      });
    });

    test('dark aubergine', () {
      expect(generateYaruColor(0xFF2C001E).toHex(), {
        0: '#2c001e',
        50: '#ffdce6',
        100: '#e3b6c6',
        200: '#be8ca0',
        300: '#9b6379',
        400: '#81455f',
        500: '#682745',
        600: '#5d203d',
        700: '#4d1632',
        800: '#3c0b29',
        900: '#2c001e',
      });
    });
  });

  group('material', () {
    test('red', () {
      final primary = MaterialColors.red.primary;
      expect(
        generateYaruColor(primary).toHex(),
        MaterialColors.red.toHex(),
      );
    });

    test('pink', () {
      final primary = MaterialColors.pink.primary;
      expect(
        generateYaruColor(primary).toHex(),
        MaterialColors.pink.toHex(),
      );
    });

    test('purple', () {
      final primary = MaterialColors.purple.primary;
      expect(
        generateYaruColor(primary).toHex(),
        MaterialColors.purple.toHex(),
      );
    });

    test('deepPurple', () {
      final primary = MaterialColors.deepPurple.primary;
      expect(
        generateYaruColor(primary).toHex(),
        MaterialColors.deepPurple.toHex(),
      );
    });

    test('indigo', () {
      final primary = MaterialColors.indigo.primary;
      expect(
        generateYaruColor(primary).toHex(),
        MaterialColors.indigo.toHex(),
      );
    });

    test('blue', () {
      final primary = MaterialColors.blue.primary;
      expect(
        generateYaruColor(primary).toHex(),
        MaterialColors.blue.toHex(),
      );
    });

    test('lightBlue', () {
      final primary = MaterialColors.lightBlue.primary;
      expect(
        generateYaruColor(primary).toHex(),
        MaterialColors.lightBlue.toHex(),
      );
    });

    test('cyan', () {
      final primary = MaterialColors.cyan.primary;
      expect(
        generateYaruColor(primary).toHex(),
        MaterialColors.cyan.toHex(),
      );
    });

    test('teal', () {
      final primary = MaterialColors.teal.primary;
      expect(
        generateYaruColor(primary).toHex(),
        MaterialColors.teal.toHex(),
      );
    });

    test('green', () {
      final primary = MaterialColors.green.primary;
      expect(
        generateYaruColor(primary).toHex(),
        MaterialColors.green.toHex(),
      );
    });

    test('lightGreen', () {
      final primary = MaterialColors.lightGreen.primary;
      expect(
        generateYaruColor(primary).toHex(),
        MaterialColors.lightGreen.toHex(),
      );
    });

    test('lime', () {
      final primary = MaterialColors.lime.primary;
      expect(
        generateYaruColor(primary).toHex(),
        MaterialColors.lime.toHex(),
      );
    });

    test('yellow', () {
      final primary = MaterialColors.yellow.primary;
      expect(
        generateYaruColor(primary).toHex(),
        MaterialColors.yellow.toHex(),
      );
    }, skip: true); // TODO: fix to pass

    test('amber', () {
      final primary = MaterialColors.amber.primary;
      expect(
        generateYaruColor(primary).toHex(),
        MaterialColors.amber.toHex(),
      );
    });

    test('orange', () {
      final primary = MaterialColors.orange.primary;
      expect(
        generateYaruColor(primary).toHex(),
        MaterialColors.orange.toHex(),
      );
    });

    test('deepOrange', () {
      final primary = MaterialColors.deepOrange.primary;
      expect(
        generateYaruColor(primary).toHex(),
        MaterialColors.deepOrange.toHex(),
      );
    });

    test('brown', () {
      final primary = MaterialColors.brown.primary;
      expect(
        generateYaruColor(primary).toHex(),
        MaterialColors.brown.toHex(),
      );
    });

    test('blueGrey', () {
      final primary = MaterialColors.blueGrey.primary;
      expect(
        generateYaruColor(primary).toHex(),
        MaterialColors.blueGrey.toHex(),
      );
    });
  });
}

extension HexPalette on Palette {
  Map<int, String> toHex() {
    return {
      for (final c in entries)
        c.key: '#${(c.value & 0xffffff).toRadixString(16).padLeft(6, '0')}',
    };
  }
}
