// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collaborator_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollaboratorDTO _$CollaboratorDTOFromJson(Map<String, dynamic> json) =>
    CollaboratorDTO(
      json['firstName'] as String,
      json['lastName'] as String,
      json['userGuid'] as String,
      json['imageUrl'] as String,
      json['roleCd'] as String,
      forUnheard: json['forUnheard'] as bool? ?? false,
    );

Map<String, dynamic> _$CollaboratorDTOToJson(CollaboratorDTO instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userGuid': instance.userGuid,
      'imageUrl': instance.imageUrl,
      'roleCd': instance.roleCd,
      'forUnheard': instance.forUnheard,
    };
