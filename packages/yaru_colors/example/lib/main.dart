import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart' hide YaruColors; // TODO
import 'package:yaru_colors/yaru_colors.dart';

const tileWidth = 360.0;
const tileHeight = 40.0;
const tileSpacing = 24.0;

const accentColors = {
  'YaruColors.orange': YaruColors.orange,
  'YaruColors.bark': YaruColors.bark,
  'YaruColors.sage': YaruColors.sage,
  'YaruColors.olive': YaruColors.olive,
  'YaruColors.viridian': YaruColors.viridian,
  'YaruColors.prussianGreen': YaruColors.prussianGreen,
  'YaruColors.blue': YaruColors.blue,
  'YaruColors.purple': YaruColors.purple,
  'YaruColors.magenta': YaruColors.magenta,
  'YaruColors.red': YaruColors.red,
};

const flavorColors = {
  'YaruColors.kubuntuBlue': YaruColors.kubuntuBlue,
  'YaruColors.lubuntuBlue': YaruColors.lubuntuBlue,
  'YaruColors.ubuntuBudgieBlue': YaruColors.ubuntuBudgieBlue,
  'YaruColors.ubuntuMateGreen': YaruColors.ubuntuMateGreen,
  'YaruColors.ubuntuStudioBlue': YaruColors.ubuntuStudioBlue,
  'YaruColors.xubuntuBlue': YaruColors.xubuntuBlue,
};

const neutralColors = {
  'YaruColors.warmGrey': YaruColors.warmGrey,
};

const shades = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: YaruTheme(
        child: Scaffold(
          appBar: AppBar(title: const Text('Yaru Colors')),
          body: IndexedStack(
            index: _currentPage,
            children: const [
              ColorView(colors: accentColors),
              ColorView(colors: flavorColors),
              ColorView(colors: neutralColors),
              ColorSelector(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.color_lens),
                label: 'Accent',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Flavor',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sentiment_neutral),
                label: 'Neutral',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.colorize),
                label: 'Custom',
              )
            ],
            currentIndex: _currentPage,
            onTap: (index) => setState(() => _currentPage = index),
          ),
        ),
      ),
    );
  }
}

class ColorView extends StatelessWidget {
  const ColorView({Key? key, required this.colors}) : super(key: key);

  final Map<String, MaterialColor> colors;

  @override
  Widget build(BuildContext context) {
    return GridView(
      primary: false, // https://github.com/flutter/flutter/issues/93862
      padding: const EdgeInsets.all(tileSpacing),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: tileWidth,
        mainAxisExtent: tileHeight * shades.length,
        mainAxisSpacing: tileSpacing,
        crossAxisSpacing: tileSpacing,
      ),
      children: colors.entries.map((c) {
        return ColorSwatch(name: c.key, color: c.value);
      }).toList(),
    );
  }
}

class ColorSelector extends StatefulWidget {
  const ColorSelector({Key? key}) : super(key: key);

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  var _currentColor = YaruColors.generate(0xFF77216F);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Column(
          children: [
            const Spacer(),
            ColorPicker(
              color: _currentColor,
              enableShadesSelection: false,
              pickersEnabled: const {
                ColorPickerType.accent: false,
                ColorPickerType.primary: false,
                ColorPickerType.custom: false,
                ColorPickerType.wheel: true,
              },
              onColorChanged: (color) {
                setState(
                    () => _currentColor = YaruColors.generate(color.value));
              },
            ),
            const Spacer(),
          ],
        ),
        const Spacer(),
        SizedBox(
          width: tileWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ColorSwatch(name: 'custom', color: _currentColor),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

class ColorSwatch extends StatelessWidget {
  const ColorSwatch({
    Key? key,
    required this.name,
    required this.color,
  }) : super(key: key);

  final String name;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: Key(name),
      mainAxisSize: MainAxisSize.min,
      children: shades.map((shade) {
        return ColorTile(
          name: name,
          shade: shade,
          color: color[shade]!,
          isPrimary: color.value == color[shade]!.value,
        );
      }).toList(),
    );
  }
}

class ColorTile extends StatelessWidget {
  const ColorTile({
    Key? key,
    required this.name,
    required this.shade,
    required this.color,
    required this.isPrimary,
  }) : super(key: key);

  final String name;
  final int shade;
  final Color color;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        fontFamily: 'Ubuntu Mono',
        fontSize: Theme.of(context).textTheme.caption!.fontSize,
        color: color.isDark ? YaruColors.porcelain : YaruColors.textGrey,
        fontWeight: isPrimary ? FontWeight.bold : FontWeight.normal,
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        color: color,
        height: tileHeight,
        child: Row(
          children: [
            Expanded(
              child: Text(
                isPrimary ? name : '$name[$shade]',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            SelectableText(color.toHex()),
          ],
        ),
      ),
    );
  }
}

extension ColorX on Color {
  bool get isDark {
    return ThemeData.estimateBrightnessForColor(this) == Brightness.dark;
  }

  String toHex() {
    return '#${(value & 0xffffff).toRadixString(16).padLeft(6, '0')}';
  }
}
