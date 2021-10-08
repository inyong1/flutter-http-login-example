import 'package:eproconnect/blocs/login_bloc.dart';
import 'package:eproconnect/screens/home/home_screen.dart';
import 'package:eproconnect/states/data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

class LoginScreen extends StatelessWidget {
  static const routName = '/login';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocListener<LoginBloc, DataState>(
                listener: (context, state) {
                  if (state is DataStateError) {
                    scaffoldKey.currentState?.showBottomSheet(
                      (context) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Material(
                          color: Colors.orange[100],
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              state.message ?? "error",
                              style: TextStyle(color: Colors.red[800]),
                            ),
                          ),
                        ),
                      ),
                      elevation: 2,
                    );
                  } else if (state is DataStateSuccess) {
                    Future.microtask(() => Navigator.pushNamedAndRemoveUntil(
                        context, HomeScreen.routName, (route) => false));
                  }
                },
                child: SizedBox(),
              ),
              BlocBuilder<LoginBloc, DataState>(
                builder: (context, state) {
                  return state is DataStateLoading
                      ? LinearProgressIndicator()
                      : SizedBox();
                },
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(label: Text("Email")),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(label: Text("Password")),
                textInputAction: TextInputAction.go,
                onSubmitted: (v) {
                  context
                      .read<LoginBloc>()
                      .login(emailController.text, passwordController.text);
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    context
                        .read<LoginBloc>()
                        .login(emailController.text, passwordController.text);
                  },
                  child: Text("LOGIN"))
            ],
          ),
        ),
      ),
    );
  }
}
