part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final LoginParams params;
  LoginEvent({
    required this.params,
  });
}

class SignUpEvent extends AuthEvent {
  final SignUpParams params;

  SignUpEvent({
    required this.params,
  });
}
