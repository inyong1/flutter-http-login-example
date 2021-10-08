import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {
  Future<http.Response> login(
      {required String email, required String password}) {
    return http.post(Uri.parse("https://efpro.site/api/auth/login"),
        body: {"email": email, "password": password},
        headers: {HttpHeaders.acceptHeader: "application/json"});
  }
}
