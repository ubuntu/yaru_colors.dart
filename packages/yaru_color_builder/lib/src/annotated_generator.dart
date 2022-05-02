import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

typedef AnnotatedVariableElement = AnnotatedElement<VariableElement>;
typedef AnnotatedGetterElement = AnnotatedElement<PropertyAccessorElement>;

class AnnotatedElement<T extends Element> {
  const AnnotatedElement(this.annotation, this.element);

  final ConstantReader annotation;
  final T element;
}

class AnnotatedClassElement {
  const AnnotatedClassElement(
    this.element, {
    required this.fields,
    required this.getters,
  });

  final ClassElement element;
  final Iterable<AnnotatedVariableElement> fields;
  final Iterable<AnnotatedGetterElement> getters;
}

abstract class AnnotatedGenerator<T> extends Generator {
  TypeChecker get annotation => TypeChecker.fromRuntime(T);

  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {
    return [
      ...library.annotatedVariables(annotation).map(generateVariable),
      ...library.annotatedGetters(annotation).map(generateGetter),
      ...library.annotatedClasses(annotation).map(generateClass),
    ].join('\n\n');
  }

  String generateVariable(AnnotatedVariableElement element);
  String generateGetter(AnnotatedGetterElement element);
  String generateClass(AnnotatedClassElement element);
}

extension AnnotatedElements<T extends Element> on Iterable<T> {
  Iterable<AnnotatedElement<T>> annotatedWith(TypeChecker checker) sync* {
    for (final element in this) {
      final annotation = checker.firstAnnotationOf(element);
      if (annotation != null) {
        yield AnnotatedElement(ConstantReader(annotation), element);
      }
    }
  }
}

extension ClassElementX on ClassElement {
  AnnotatedClassElement annotatedWith(TypeChecker checker) {
    return AnnotatedClassElement(
      this,
      fields: annotatedFields(checker),
      getters: annotatedGetters(checker),
    );
  }

  Iterable<PropertyAccessorElement> get getters {
    return accessors.where((e) => e.isGetter);
  }

  Iterable<AnnotatedGetterElement> annotatedGetters(TypeChecker checker) {
    return getters.annotatedWith(checker);
  }

  Iterable<AnnotatedVariableElement> annotatedFields(TypeChecker checker) {
    return fields.annotatedWith(checker);
  }
}

extension LibraryReaderX on LibraryReader {
  Iterable<PropertyAccessorElement> get accessors {
    return allElements.whereType<PropertyAccessorElement>();
  }

  Iterable<PropertyAccessorElement> get getters {
    return accessors.where((e) => e.isGetter);
  }

  Iterable<VariableElement> get variables {
    return allElements.whereType<VariableElement>();
  }

  Iterable<AnnotatedGetterElement> annotatedGetters(TypeChecker checker) {
    return getters.annotatedWith(checker);
  }

  Iterable<AnnotatedVariableElement> annotatedVariables(TypeChecker checker) {
    return variables.annotatedWith(checker);
  }

  Iterable<AnnotatedClassElement> annotatedClasses(TypeChecker checker) {
    return classes
        .map((c) => c.annotatedWith(checker))
        .where((c) => c.fields.isNotEmpty || c.getters.isNotEmpty);
  }
}
