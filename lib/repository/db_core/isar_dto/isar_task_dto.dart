import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import '../db_core.dart';

part 'isar_task_dto.g.dart';

@JsonSerializable(explicitToJson: true)
@collection
class IsarTaskDTO extends BaseCarbonDTO {
  Id isarId = Isar.autoIncrement;

  late String id;
  late String text;
  late int randomNumber;

  IsarTaskDTO({
    required this.id,
    this.text = '',
    this.randomNumber = -1,
  });

  factory IsarTaskDTO.fromJson(Map<String, dynamic> data) => _$IsarTaskDTOFromJson(data);

  Map<String, dynamic> toJson() => _$IsarTaskDTOToJson(this);

  @override
  String? get dbID => id;
}
