import 'package:eproconnect/models/user.dart';
import 'package:eproconnect/repositories/user_repository.dart';
import 'package:eproconnect/states/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Cubit<DataState<User?>> {
  UserBloc() : super(DataStateEmpty());

  Future<void> loadUser() async {
    print("UserBloc: loadUser");
    emit(DataStateLoading());
    final user = await UserRepository().getUser();
    if (user != null) {
      emit(DataStateSuccess(data: user));
    } else {
      emit(DataStateError(message: "User belum login"));
    }
  }

  void deleteUser() {
    print("deleting user...");
    emit(DataStateLoading());
    UserRepository().deleteUser().then((value) {
      emit(DataStateError());
    });
  }
}
