// ignore_for_file: public_member_api_docs, sort_constructors_first
class Collaborator {
  String firstName;
  String lastName;
  String userGuid;
  String imageUrl;
  String roleCd;
  bool forUnheard;

  Collaborator(
    this.firstName,
    this.lastName,
    this.userGuid,
    this.imageUrl,
    this.roleCd, {
    this.forUnheard = false,
  });

  bool isRoleGuest() {
    return roleCd == 'guest';
  }

  @override
  bool operator ==(covariant Collaborator other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.userGuid == userGuid &&
        other.imageUrl == imageUrl &&
        other.roleCd == roleCd &&
        other.forUnheard == forUnheard;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        userGuid.hashCode ^
        imageUrl.hashCode ^
        roleCd.hashCode ^
        forUnheard.hashCode;
  }
}
