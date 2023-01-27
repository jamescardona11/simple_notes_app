// ignore_for_file: public_member_api_docs, sort_constructors_first
class Reactions {
  String id;
  String name;
  String imageUrl;
  String code;
  String reactionTts;

  Reactions({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.code,
    required this.reactionTts,
  });

  @override
  bool operator ==(covariant Reactions other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.imageUrl == imageUrl && other.code == code && other.reactionTts == reactionTts;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ imageUrl.hashCode ^ code.hashCode ^ reactionTts.hashCode;
  }
}
