import 'package:db_adapter_flutter/data_layer/core_db/i_carbon_id_model.dart';
import 'package:db_adapter_flutter/domain/notes.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notes_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class NotesDTO implements BaseCarbonIdModel {
  final String id;
  final String text;
  final int randomNumber;

  NotesDTO({
    required this.id,
    required this.text,
    required this.randomNumber,
  });

  factory NotesDTO.fromEntity(Notes note) => NotesDTO(
        id: note.id,
        text: note.text,
        randomNumber: note.randomNumber,
      );

  Notes toEntity() => Notes(
        id: id,
        text: text,
        randomNumber: randomNumber,
      );

  factory NotesDTO.fromJson(Map<String, dynamic> json) => _$NotesDTOFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NotesDTOToJson(this);

  // how to improve this?
  @override
  String? get dbID => id;
}
