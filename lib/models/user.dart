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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'], username: json['username'], password: json['password']);
  }

  //Export to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
