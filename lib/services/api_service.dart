import 'dart:io';

import 'package:eproconnect/repositories/user_repository.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "https://efpro.site";

  //fungsi login
  Future<http.Response> login(
      {required String email, required String password}) {
    return doPost("/api/auth/login",
        body: {"email": email, "password": password});
  }

  //mengambil daftar pelatihan
  Future<http.Response> getPelatihanList() => doGet("/api/pelatihan");

  //mengambil daftar pelatihan
  Future<http.Response> getPropelList() => doGet("/api/auth/propel");

  ////////////////////////////////////////////////////
  Future<Map<String, String>> getDefaultHeader() async {
    final token = await UserRepository().getUserToken();
    return {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
  }

  Future<http.Response> doPost(String path,
      {Map<String, String> headers = const {},
      body = Object,
      String base = ""}) async {
    final defaultHeaders = await getDefaultHeader();
    defaultHeaders.addAll(headers);
    if (base.isEmpty) base = baseUrl;
    String url = "$base$path";
    print("[POST]  =>$url");
    print("[HEADER]=>$defaultHeaders");
    print("[BODY]  =>$body");

    return http.post(Uri.parse(url), body: body, headers: defaultHeaders);
  }

  Future<http.Response> doGet(String path,
      {Map<String, String> headers = const {}, String base = ""}) async {
    final defaultHeaders = await getDefaultHeader();
    defaultHeaders.addAll(headers);
    if (base.isEmpty) base = baseUrl;
    String url = "$base$path";
    print("[GETT]  =>$url");
    print("[HEADER]=>$defaultHeaders");
    return http.get(Uri.parse(url), headers: defaultHeaders);
  }
}
