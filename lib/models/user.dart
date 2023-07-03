class User {
  final int id;
  final String username;
  final String password;

  User({required this.id, required this.username, required this.password});

  //Create the user object from json input
  // User.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   username = json['username'];
  //   password = json['password'];
  // }

  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //       id: json['id'], username: json['username'], password: json['password']);
  // }

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        id: parsedJson['id'],
        username: parsedJson['username'].toString(),
        password: parsedJson['password'].toString());
  }

  //Export to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
