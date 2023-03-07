import 'dart:developer';
import 'package:openai_dart/openai_dart.dart';
import 'package:openai_dart/src/configuration.dart';

void main() async {
  const config = Configuration(
    apiKey: 'apiKey',
  );

  final openai = OpenAI(configuration: config);
  final request = ChatCompletionRequest(
    messages: [
      const Message(role: ChatCompletionRole.user, content: 'Hello assistant.')
    ],
    model: 'gpt-3.5-turbo',
    temperature: 1,
  );

  final stream = openai.createChatCompletion(completionRequest: request);

  try {
    await stream.forEach((element) {
      log(element.choices[0].delta!.content!);
    });
  } catch (e, stackTrace) {
    log('Error: ', error: e);
    log('stackTarce:', stackTrace: stackTrace);
  }
}
