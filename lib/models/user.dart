class User {
  int id = 0;
  String username = '';
  String password = '';

  //User({});

  User({required this.id, required this.username, required this.password});

  //Create the user object from json input
  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
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
