import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'choice.dart';


part 'completion.g.dart';

/// {@template completion}
/// Completion description
/// {@endtemplate}
@JsonSerializable()
class Completion extends Equatable {
  /// {@macro completion}
  const Completion({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
  });

  /// Creates a Completion from Json map
  factory Completion.fromJson(Map<String, dynamic> data) =>
      _$CompletionFromJson(data);

  /// A description for id
  final String id;

  /// A description for object
  final String object;

  /// A description for created
  final int created;

  /// A description for model
  final String model;

  /// A description for choices
  final List<Choice> choices;

  @override
  List<Object?> get props => [
        id,
        object,
        created,
        model,
        choices,
      ];

  /// Creates a Json map from a Completion
  Map<String, dynamic> toJson() => _$CompletionToJson(this);
}
