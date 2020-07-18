import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/Example2/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_bloc_practice/Example2/bloc/login/login_bloc.dart';
import 'package:flutter_bloc_practice/Example2/utils/UserData.dart';

class LoginScreen extends StatelessWidget {
  final UserData userData;

  const LoginScreen({Key key, @required this.userData})
      : assert(userData != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),
      body: BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
                authenticationBloc:
                    BlocProvider.of<AuthenticationBloc>(context),
                userData: userData,
              ),
          child: LoginForm()),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onLoginButtonPress() {
    BlocProvider.of<LoginBloc>(context).add(
      LoginButtonPressed(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              controller: _emailController,
            ),
            SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              controller: _passwordController,
            ),
            SizedBox(height: 16.0),
            RaisedButton(
              onPressed: state is! LoginInProgress ? _onLoginButtonPress : null,
              child: Text("Login"),
            ),
            SizedBox(height: 16.0),
            Container(
              child:
                  state is LoginInProgress ? CircularProgressIndicator() : null,
            )
          ],
        ),
      ),
    );
  }
}
