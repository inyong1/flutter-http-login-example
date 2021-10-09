import 'package:eproconnect/repositories/pelatihan_repository.dart';
import 'package:eproconnect/states/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PelatihanBloc extends Cubit<DataState> {
  PelatihanBloc() : super(DataStateEmpty()) {
    loadDaftarPelatihan();
  }

  void loadDaftarPelatihan() {
    print("loadDaftarPelatihan...");
    PelatihanRepository().getPelatihanList();
  }
}
