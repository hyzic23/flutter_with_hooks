import 'dart:convert';
import 'package:flutter_with_hooks_app/models/user_model.dart';
import 'package:flutter_with_hooks_app/models/user_name.dart';
import 'package:flutter_with_hooks_app/models/user_picture.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<UserModel>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((user) {
      final name = UserName(
          title: user['name']['title'],
          first: user['name']['first'],
          last: user['name']['last']);

      final image = UserPicture(
          large: user['picture']['large'],
          medium: user['picture']['large'],
          thumbnail: user['picture']['thumbnail']);

      return UserModel(
          gender: user['gender'],
          email: user['email'],
          phone: user['phone'],
          cell: user['cell'],
          nat: user['nat'],
          name: name,
          image: image);
    }).toList();

    return users;
  }
}
