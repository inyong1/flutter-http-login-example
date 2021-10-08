import 'package:eproconnect/repositories/user_repository.dart';
import 'package:eproconnect/states/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Cubit<DataState> {
  LoginBloc() : super(DataStateEmpty());

  void login(String email, String password) {
    print("loging in...");
    emit(DataStateLoading());
    UserRepository().login(email: email, password: password).then((value) {
      print("login response: $value");
      emit(value);
    });
  }
}
