import 'dart:convert';
import 'package:flutter_with_hooks_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<UserModel>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((user) {
      return UserModel.fromMap(user);
    }).toList();

    return users;
  }
}
