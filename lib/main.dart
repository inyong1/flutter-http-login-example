import 'package:eproconnect/blocs/login_bloc.dart';
import 'package:eproconnect/blocs/pelatihan_bloc.dart';
import 'package:eproconnect/blocs/user_bloc.dart';
import 'package:eproconnect/screens/home/home_screen.dart';
import 'package:eproconnect/screens/login/login_screen.dart';
import 'package:eproconnect/screens/pelatihan/pelatihan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: globalProviders,
        child: MaterialApp(
          title: 'E-Pro Connect',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: routes,
          initialRoute: HomeScreen.routName,
        ));
  }
}

final globalProviders = [
  BlocProvider(create: (context) => UserBloc()),
];

final routes = <String, WidgetBuilder>{
  HomeScreen.routName: (context) => HomeScreen(),
  LoginScreen.routName: (context) => BlocProvider(
        create: (context) => LoginBloc(),
        child: LoginScreen(),
      ),
  PelatihanScreen.routName: (context) => BlocProvider(
        create: (context) => PelatihanBloc(),
        child: PelatihanScreen(),
      )
};
