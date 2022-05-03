import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/color_generator.dart';

Builder yaruColorBuilder(BuilderOptions options) {
  return PartBuilder([YaruColorGenerator()], '.g.dart', options: options);
}
