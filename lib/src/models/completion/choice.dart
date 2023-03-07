import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'message.dart';

part 'choice.g.dart';

/// {@template choice}
/// Choice description
/// {@endtemplate}
@JsonSerializable()
class Choice extends Equatable {
  /// {@macro choice}
  const Choice({
    this.delta,
    this.finish_reason,
    this.index,
  });

  /// Creates a Choice from Json map
  factory Choice.fromJson(Map<String, dynamic> data) => _$ChoiceFromJson(data);

  /// A description for message
  final Message? delta;

  /// A description for finish_reason
  final String? finish_reason;

  /// A description for index
  final int? index;

  @override
  List<Object?> get props => [
        delta,
        finish_reason,
        index,
      ];

  /// Creates a Json map from a Choice
  Map<String, dynamic> toJson() => _$ChoiceToJson(this);
}
