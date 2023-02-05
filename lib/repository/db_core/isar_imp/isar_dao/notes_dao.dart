// import 'package:isar/isar.dart';
// import 'package:simple_notes_app/core/i_carbon_dto.dart';

// part 'notes_dao.g.dart';

// // abstract class BaseInternalDAO {
// //   Map<String, dynamic> toJson();
// // }

// @collection
// class IsarNotesDAO extends BaseCarbonDTO {
//   Id isarId = Isar.autoIncrement;

//   late String id;
//   late String text;
//   late int randomNumber;

//   IsarNotesDAO({
//     required this.id,
//     this.text = '',
//     this.randomNumber = -1,
//   });

//   // how to improve this
//   factory IsarNotesDAO.fromMap(Map<String, dynamic> data) => IsarNotesDAO(
//         id: data['id'] as String,
//         text: data['text'] as String,
//         randomNumber: data['randomNumber'] as int,
//       );

//   @override
//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'text': text,
//         'randomNumber': randomNumber,
//       };

//   @override
//   String? get dbID => throw UnimplementedError();
// }
