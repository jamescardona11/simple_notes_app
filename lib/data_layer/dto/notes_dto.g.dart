// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotesDTO _$NotesDTOFromJson(Map<String, dynamic> json) => NotesDTO(
      id: json['id'] as String,
      text: json['text'] as String,
      randomNumber: json['randomNumber'] as int,
    );

Map<String, dynamic> _$NotesDTOToJson(NotesDTO instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'randomNumber': instance.randomNumber,
    };
