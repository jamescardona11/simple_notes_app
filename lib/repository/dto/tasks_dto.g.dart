// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) => TaskDto(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      isDeleted: json['isDeleted'] as bool? ?? false,
      isDone: json['isDone'] as bool? ?? false,
    );

Map<String, dynamic> _$TaskDtoToJson(TaskDto instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'isDeleted': instance.isDeleted,
      'isDone': instance.isDone,
      'id': instance.id,
    };
