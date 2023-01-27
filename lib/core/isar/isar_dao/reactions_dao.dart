import 'package:isar/isar.dart';

part 'reactions_dao.g.dart';

@collection
class ISarReactionsDAO {
  Id myObjectId = Isar.autoIncrement;

  final String id;
  final String name;
  final String imageUrl;
  final String code;
  final String reactionTts;

  ISarReactionsDAO({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.code,
    required this.reactionTts,
  });

  factory ISarReactionsDAO.fromMap(Map<String, dynamic> data) => ISarReactionsDAO(
        id: data['id'] as String,
        name: data['name'] as String,
        imageUrl: data['imageUrl'] as String,
        code: data['code'] as String,
        reactionTts: data['reactionTts'] as String,
      );
}
