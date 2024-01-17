// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProfileSetUp {
  String? name;
  String? gender;
  String? birthday;
  ProfileSetUp({
    this.name,
    this.gender,
    this.birthday,
  });

  ProfileSetUp copyWith({
    String? name,
    String? gender,
    String? birthday,
  }) {
    return ProfileSetUp(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
    );
  }

  @override
  bool operator ==(covariant ProfileSetUp other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.gender == gender &&
        other.birthday == birthday;
  }

  @override
  int get hashCode => name.hashCode ^ gender.hashCode ^ birthday.hashCode;
}
