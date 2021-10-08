import 'dart:convert';

import 'package:eproconnect/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<void> saveUser(User user) async {
    final sp = await SharedPreferences.getInstance();
    sp.setString('user', user.toString());
  }

  Future<User?> getUser() async {
    User? u;
    final sp = await SharedPreferences.getInstance();
    final String s = sp.getString('user') ?? '';
    if (s.startsWith('{')) {
      u = User.fromJson(json.decode(s));
    }
    return u;
  }

  Future<void> deleteUser() async {
    final sp = await SharedPreferences.getInstance();
    sp.remove('user');
  }
}
