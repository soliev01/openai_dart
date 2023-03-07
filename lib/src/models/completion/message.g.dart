// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      content: json['content'] as String?,
      role: $enumDecodeNullable(_$ChatCompletionRoleEnumMap, json['role']),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'role': _$ChatCompletionRoleEnumMap[instance.role],
      'content': instance.content,
    };

const _$ChatCompletionRoleEnumMap = {
  ChatCompletionRole.system: 'system',
  ChatCompletionRole.user: 'user',
  ChatCompletionRole.assistant: 'assistant',
};
