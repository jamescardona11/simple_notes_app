import 'package:db_adapter_flutter/data_layer/core_db/i_carbon_id_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reactions_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ReactionsDTO implements BaseCarbonIdModel {
  String id;
  String name;
  String imageUrl;
  String code;
  String reactionTts;

  ReactionsDTO({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.code,
    required this.reactionTts,
  });

  factory ReactionsDTO.fromJson(Map<String, dynamic> json) => _$ReactionsDTOFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ReactionsDTOToJson(this);

  @override
  String? get dbID => id;
}
