import 'package:json_annotation/json_annotation.dart';
import 'package:openai_dart/openai_dart.dart';

part 'chat_completion_request.g.dart';

/// Creates a completion for the chat message
/// docs: https://platform.openai.com/docs/api-reference/chat/create?lang=curl
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ChatCompletionRequest {
  /// Constructor [ChatCompletionRequest]
  ChatCompletionRequest({
    required this.model,
    required this.messages,
    this.maxTokens = 300,
    this.temperature,
    this.n = 1,
    this.stream = true,
    // this.user,
  });

  /// toJson onverter
  Map<String, dynamic> toJson() => _$ChatCompletionRequestToJson(this);

  /// ID of the model to use. Currently, only gpt-3.5-turbo and
  /// gpt-3.5-turbo-0301 are supported.
  final String model;

  /// The messages to generate chat completions for, in the chat format.
  final List<Message> messages;

  /// Maximum tokens to be uses for each request
  final int? maxTokens;

  /// What sampling temperature to use, between 0 and 2. Higher values like 0.8
  /// will make the output more random, while lower values like 0.2 will
  /// make it more focused and deterministic.
  final double? temperature;

  /// Number of chat completion choices to generate for each input message
  final int? n;

  /// If set, partial message deltas will be sent, like in ChatGPT.
  /// Tokens will be sent as data-only server-sent events as they become
  /// available, with the stream terminated by a data: `DONE` message.
  final bool? stream;

  /// A unique identifier representing end-user,
  /// which can help OpenAI to monitor and detect abuse
}
