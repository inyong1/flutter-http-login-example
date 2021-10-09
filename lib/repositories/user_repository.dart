import 'dart:async';
import 'dart:convert';

import 'package:eproconnect/models/login_response.dart';
import 'package:eproconnect/models/user.dart';
import 'package:eproconnect/services/api_service.dart';
import 'package:eproconnect/services/storage_service.dart';
import 'package:eproconnect/states/data_state.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<DataState> login({required String email, required String password}) {
    final Completer<DataState> completer = Completer<DataState>();
    ApiService()
        .login(email: email, password: password)
        .then((http.Response response) {
      if (!response.body.startsWith("{")) {
        completer.complete(DataStateError(message: response.body));
      } else {
        LoginResponse loginResponse =
            LoginResponse.fromJson(json.decode(response.body));
        if (response.statusCode < 200 || response.statusCode >= 300) {
          completer.complete(DataStateError(message: loginResponse.message));
        } else {
          if (loginResponse.user != null) {
            StorageService().saveUser(loginResponse.user!).then((value) {
              completer.complete(DataStateSuccess());
            });
          } else {
            completer.complete(DataStateError(message: loginResponse.message));
          }
        }
      }
    }).catchError((onError) {
      completer.complete(DataStateError(message: onError.toString()));
    });

    return completer.future;
  }

  Future<User?> getUser() {
    return StorageService().getUser();
  }

  Future<String> getUserToken() async {
    final User? user = await getUser();
    return user?.token ?? "";
  }

  Future<void> deleteUser() {
    return StorageService().deleteUser();
  }
}
