part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String email, password;

  LoginButtonPressed({
    @required this.email,
    @required this.password,
  });
}
