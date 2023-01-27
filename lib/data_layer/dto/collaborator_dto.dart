import 'package:db_adapter_flutter/data_layer/core_db/i_carbon_id_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collaborator_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class CollaboratorDTO implements BaseCarbonIdModel {
  final String firstName;
  final String lastName;
  final String userGuid;
  final String imageUrl;
  final String roleCd;
  final bool forUnheard;

  CollaboratorDTO(
    this.firstName,
    this.lastName,
    this.userGuid,
    this.imageUrl,
    this.roleCd, {
    this.forUnheard = false,
  });

  factory CollaboratorDTO.fromJson(Map<String, dynamic> json) => _$CollaboratorDTOFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CollaboratorDTOToJson(this);

  // how to improve this?
  @override
  String? get dbID => '$firstName$lastName$userGuid';
}
