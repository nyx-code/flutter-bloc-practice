import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice/Example2/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_bloc_practice/Example2/utils/UserData.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserData userData;
  final AuthenticationBloc authenticationBloc;
  LoginBloc({
    @required this.authenticationBloc,
    @required this.userData,
  })  : assert(userData != null),
        assert(authenticationBloc != null),
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginInProgress();

      try {
        final token = await userData.authenticate(
          email: event.email,
          password: event.password,
        );

        if (token != null) {
          authenticationBloc.add(AuthenticationLoggedIn(token: token));
          yield LoginInitial();
        } else {
          yield LoginFailure(error: "Login failed");
        }
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
