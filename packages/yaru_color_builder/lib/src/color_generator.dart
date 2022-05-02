import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:code_builder/code_builder.dart';
import 'package:yaru_color_generator/yaru_color_generator.dart';

import 'annotated_generator.dart';

String generatedTypeName(String typeName) => '_\$$typeName';

class YaruColorGenerator extends AnnotatedGenerator<GeneratedYaruColor> {
  @override
  String generateVariable(AnnotatedVariableElement element) {
    return generateField(element)
        .rebuild((b) => b..name = generatedTypeName(element.name))
        .toCode();
  }

  @override
  String generateGetter(AnnotatedGetterElement element) {
    return generateField(element)
        .rebuild((b) => b..name = generatedTypeName(element.name))
        .toCode();
  }

  @override
  String generateClass(AnnotatedClassElement element) {
    final c = Class((b) => b
      ..name = generatedTypeName(element.name)
      ..fields.addAll([
        ...element.fields
            .map((f) => generateField(f).rebuild((b) => b.static = true)),
        ...element.getters
            .map((g) => generateField(g).rebuild((b) => b.static = true)),
      ]));
    return c.toCode();
  }

  Field generateField(AnnotatedElement element) {
    final color = generateYaruColor(element.primary);

    final primary = color.primary.toHex();
    final shades = color.entries.where((s) => s.key != 0).map((s) {
      return '${s.key}: ${s.value.toHex()}';
    }).join(',');

    final field = Field((b) => b
      ..modifier = FieldModifier.constant
      ..name = element.name
      ..type = refer(element.type.toString())
      ..assignment = Code('${element.type}($primary, {$shades})'));
    return field;
  }
}

extension HexColor on int {
  String toHex() {
    return '0x${toRadixString(16).padLeft(6, '0').padLeft(8, 'F').toUpperCase()}';
  }
}

extension CodeSpec on Spec {
  String toCode() => '${accept(DartEmitter())}';
}

extension AnnotatedColorElement on AnnotatedElement {
  String get name => '${element.name}';

  PropertyAccessorElement? get getter => element is PropertyAccessorElement
      ? element as PropertyAccessorElement
      : null;

  VariableElement? get variable =>
      element is VariableElement ? element as VariableElement : null;

  DartType? get type => getter?.returnType ?? variable?.type;

  int get primary => annotation.read('primary').intValue;
}

extension AnnotatedColorClassElement on AnnotatedClassElement {
  String get name => element.name;
}
