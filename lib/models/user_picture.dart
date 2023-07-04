class UserPicture {
  final String? large;
  final String medium;
  final String thumbnail;

  UserPicture({
    this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory UserPicture.fromMap(Map<String, dynamic> json) {
    return UserPicture(
        large: json['large'],
        medium: json['large'],
        thumbnail: json['thumbnail']);
  }
}
