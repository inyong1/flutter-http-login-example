import 'package:eproconnect/blocs/user_bloc.dart';
import 'package:eproconnect/models/user.dart';
import 'package:eproconnect/screens/login/login_screen.dart';
import 'package:eproconnect/states/data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            ElevatedButton(
                onPressed: () => context.read<UserBloc>().deleteUser(),
                child: Text("LOGOUT")),
            BlocConsumer<UserBloc, DataState<User?>>(
              listener: (context, state) {
                print("UserBlocListener: state: $state");
                if (state is DataStateError) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.routName, (a) => false);
                }
              },
              listenWhen: (previous, current) => current != previous,
              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: Image.network(state.data?.pict ?? ""),
                    ),
                    Text("user:\n${state.data?.toString()}"),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
