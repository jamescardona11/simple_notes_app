import 'package:isar/isar.dart';

part 'isar_collaborator_dao_ex.g.dart';

@collection
class IsarCollaboratorDAO {
  Id id = Isar.autoIncrement;

  late String firstName;
  late String lastName;
  late String userGuid;
  late String imageUrl;
  late String roleCd;
  late bool forUnheard;

  IsarCollaboratorDAO(
    this.firstName,
    this.lastName,
    this.userGuid,
    this.imageUrl,
    this.roleCd, {
    this.forUnheard = false,
  });

  // how to improve this
  factory IsarCollaboratorDAO.fromMap(Map<String, dynamic> data) => IsarCollaboratorDAO(
        data['firstName'] as String,
        data['lastName'] as String,
        data['userGuid'] as String,
        data['imageUrl'] as String,
        data['roleCd'] as String,
        forUnheard: data['forUnheard'] as bool,
      );
}
