import 'package:eproconnect/blocs/pelatihan_bloc.dart';
import 'package:eproconnect/states/data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PelatihanScreen extends StatelessWidget {
  static const routName = "/pelatihan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pelatihan")),
      body: BlocBuilder<PelatihanBloc, DataState>(
        builder: (context, state) => ListView.builder(
          itemBuilder: (context, index) => Text("Test"),
        ),
      ),
    );
  }
}
