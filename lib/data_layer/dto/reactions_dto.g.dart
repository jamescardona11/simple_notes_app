// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reactions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReactionsDTO _$ReactionsDTOFromJson(Map<String, dynamic> json) => ReactionsDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      code: json['code'] as String,
      reactionTts: json['reactionTts'] as String,
    );

Map<String, dynamic> _$ReactionsDTOToJson(ReactionsDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'code': instance.code,
      'reactionTts': instance.reactionTts,
    };
