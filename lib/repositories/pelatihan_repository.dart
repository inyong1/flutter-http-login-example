import 'dart:async';

import 'package:eproconnect/models/pelatihan.dart';
import 'package:eproconnect/services/api_service.dart';
import 'package:eproconnect/states/data_state.dart';

class PelatihanRepository {
  Future<DataState<List<Pelatihan>>> getPelatihanList() async {
    final list = <Pelatihan>[];
    final response = await ApiService().getPelatihanList();
    print(response.body);
    return DataStateSuccess<List<Pelatihan>>(data: list);
  }
}
