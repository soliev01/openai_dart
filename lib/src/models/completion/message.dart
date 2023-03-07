import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

/// Message roles
@JsonEnum()
enum ChatCompletionRole { system, user, assistant }

/// {@template message}
/// Message description
/// {@endtemplate}
@JsonSerializable()
class Message {
  /// {@macro message}
  const Message({
    this.content,
    this.role,
  });

  /// Creates a Message from Json map
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  /// A description for role
  final ChatCompletionRole? role;

  /// A description for content
  final String? content;

  Message copyWith({required String content}) {
    return Message(role: this.role, content: this.content! + content);
  }

  @override
  String toString() => content ?? '';

  /// toJson factory
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
