import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice/Example2/utils/UserData.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserData userData;

  AuthenticationBloc({@required this.userData})
      : assert(userData != null),
        super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStarted) {
      final bool isTokenExist = await userData.hasToken();

      if (isTokenExist) {
        yield AuthenticationSuccess();
      } else {
        yield AuthenticationFailure();
      }
    } else if (event is AuthenticationLoggedIn) {
      yield AuthenticationInProgress();
      await userData.addToken(event.token);
      yield AuthenticationSuccess();
    } else if (event is AuthenticationLoggedOut) {
      yield AuthenticationInProgress();
      await userData.deleteToken();
      yield AuthenticationFailure();
    }
  }
}
