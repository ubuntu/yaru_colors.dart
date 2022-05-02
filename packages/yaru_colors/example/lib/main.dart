import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart' hide YaruColors; // TODO
import 'package:yaru_colors/yaru_colors.dart';

const tileWidth = 320.0;
const tileHeight = 40.0;
const tileSpacing = 24.0;

const accentColors = {
  'orange': YaruColors.orange,
  'bark': YaruColors.bark,
  'sage': YaruColors.sage,
  'olive': YaruColors.olive,
  'viridian': YaruColors.viridian,
  'prussianGreen': YaruColors.prussianGreen,
  'blue': YaruColors.blue,
  'purple': YaruColors.purple,
  'magenta': YaruColors.magenta,
  'red': YaruColors.lightRed,
};

const flavorColors = {
  'kubuntuBlue': YaruColors.kubuntuBlue,
  'lubuntuBlue': YaruColors.lubuntuBlue,
  'ubuntuBudgieBlue': YaruColors.ubuntuBudgieBlue,
  'ubuntuMateGreen': YaruColors.ubuntuMateGreen,
  'ubuntuStudioBlue': YaruColors.ubuntuStudioBlue,
  'xubuntuBlue': YaruColors.xubuntuBlue,
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
      mainAxisSize: MainAxisSize.min,
      children: shades.map((shade) {
        return ColorTile(
          name: name,
          color: color[shade]!,
          shade: shade,
        );
      }).toList(),
    );
  }
}

class ColorTile extends StatelessWidget {
  const ColorTile({
    Key? key,
    required this.name,
    required this.color,
    required this.shade,
  }) : super(key: key);

  final String name;
  final Color color;
  final int shade;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        fontFamily: 'Ubuntu Mono',
        fontSize: Theme.of(context).textTheme.caption!.fontSize,
        color: color.isDark ? YaruColors.porcelain : YaruColors.textGrey,
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        color: color,
        height: tileHeight,
        child: Row(
          children: [
            SelectableText('$name[$shade]'),
            const Spacer(),
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
