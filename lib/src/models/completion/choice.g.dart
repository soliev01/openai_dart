// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Choice _$ChoiceFromJson(Map<String, dynamic> json) => Choice(
      delta: json['delta'] == null
          ? null
          : Message.fromJson(json['delta'] as Map<String, dynamic>),
      finish_reason: json['finish_reason'] as String?,
      index: json['index'] as int?,
    );

Map<String, dynamic> _$ChoiceToJson(Choice instance) => <String, dynamic>{
      'delta': instance.delta,
      'finish_reason': instance.finish_reason,
      'index': instance.index,
    };
