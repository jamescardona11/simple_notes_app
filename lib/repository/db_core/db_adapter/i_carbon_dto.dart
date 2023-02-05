abstract class BaseCarbonDTO {
  /// id to used in database
  /// Null for Isar because Isar has the inner id implementation
  /// Non-null for Sembast because Sembast needs a unique id
  String? get dbID;

  /// this method is used to convert data to json, then save json in db
  Map<String, dynamic> toJson();
}
