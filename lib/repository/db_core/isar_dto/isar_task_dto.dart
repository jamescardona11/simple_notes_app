// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import '../db_core.dart';

part 'isar_task_dto.g.dart';

@JsonSerializable(explicitToJson: true)
@collection
class IsarTaskDTO extends BaseCarbonDTO {
  Id? id = Isar.autoIncrement;

  // final String id;
  final String title;
  final String description;
  final bool isDeleted;
  final bool isDone;

  IsarTaskDTO({
    required this.id,
    required this.title,
    this.description = '',
    this.isDeleted = false,
    this.isDone = false,
  });

  factory IsarTaskDTO.fromJson(Map<String, dynamic> data) => IsarTaskDTO(
        id: int.tryParse(data['id'] as String) ?? -9223372036854775808,
        title: data['title'] as String,
        description: data['description'] as String? ?? '',
        isDeleted: data['isDeleted'] as bool? ?? false,
        isDone: data['isDone'] as bool? ?? false,
      );

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id.toString(),
        'title': title,
        'description': description,
        'isDeleted': isDeleted,
        'isDone': isDone,
      };

  @override
  String? get dbID => id.toString();
}
