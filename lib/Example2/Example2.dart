import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/Example2/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_bloc_practice/Example2/screens/HomeScreen.dart';
import 'package:flutter_bloc_practice/Example2/screens/LoadingScreen.dart';
import 'package:flutter_bloc_practice/Example2/screens/LoginScreen.dart';
import 'package:flutter_bloc_practice/Example2/screens/SplashScreen.dart';
import 'package:flutter_bloc_practice/Example2/utils/UserData.dart';

class Example2 extends StatelessWidget {
  final userData = UserData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(userData: userData)
            ..add(AuthenticationStarted()),
          child: _MyExample(
            userData: userData,
          )),
    );
  }
}

class _MyExample extends StatelessWidget {
  final UserData userData;

  const _MyExample({Key key, @required this.userData})
      : assert(userData != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is AuthenticationInitial) {
          return SplashScreen();
        } else if (state is AuthenticationSuccess) {
          return HomeScreen();
        } else if (state is AuthenticationFailure) {
          return LoginScreen(userData: userData);
        } else if (state is AuthenticationInProgress) {
          return LoadingScreen();
        }
      },
    );
  }
}
