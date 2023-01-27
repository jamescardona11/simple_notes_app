import 'package:isar/isar.dart';

part 'notes_dao.g.dart';

@collection
class IsarNotesDAO {
  Id isarId = Isar.autoIncrement;

  late String id;
  late String text;
  late int randomNumber;

  IsarNotesDAO({
    required this.id,
    this.text = '',
    this.randomNumber = -1,
  });

  // how to improve this
  factory IsarNotesDAO.fromMap(Map<String, dynamic> data) => IsarNotesDAO(
        id: data['id'] as String,
        text: data['text'] as String,
        randomNumber: data['randomNumber'] as int,
      );
}
