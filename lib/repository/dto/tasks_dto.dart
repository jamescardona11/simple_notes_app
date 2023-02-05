import 'package:json_annotation/json_annotation.dart';
import 'package:simple_notes_app/domian/models/tasks_model.dart';
import 'package:uuid/uuid.dart';

import '../db_core/db_core.dart';

part 'tasks_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class TaskDto extends BaseCarbonDTO {
  final String title;
  final String description;
  final bool isDeleted;
  final bool isDone;
  final String id;

  TaskDto({
    required this.id,
    required this.title,
    this.description = '',
    this.isDeleted = false,
    this.isDone = false,
  });

  factory TaskDto.fromEntity(Task task) => TaskDto(
        id: task.id,
        title: task.title,
        description: task.description,
        isDeleted: task.isDeleted,
        isDone: task.isDone,
      );

  factory TaskDto.fromJson(Map<String, dynamic> data) => _$TaskDtoFromJson(data);

  Task toEntity() => Task(
        id: id,
        title: title,
        description: description,
        isDeleted: isDeleted,
        isDone: isDone,
      );

  @override
  Map<String, dynamic> toJson() => _$TaskDtoToJson(this);

  @override
  String? get dbID => id.isEmpty ? const Uuid().v4() : id;
}
