import 'package:flutter_with_hooks_app/models/user_name.dart';
import 'package:flutter_with_hooks_app/models/user_picture.dart';

class UserModel {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserPicture image;

  UserModel(
      {required this.gender,
      required this.email,
      required this.phone,
      required this.cell,
      required this.nat,
      required this.name,
      required this.image});

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
