// ignore_for_file: prefer_const_constructors
import 'package:openai_dart/openai_dart.dart';
import 'package:openai_dart/src/configuration.dart';
import 'package:test/test.dart';

void main() {
  group('OpenaiDart', () {
    test('can be instantiated', () {
      expect(OpenAI(configuration: Configuration(apiKey: '')), isNotNull);
    });
  });
}
