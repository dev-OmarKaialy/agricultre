part of 'auth_bloc.dart';

class AuthState {
  final RequestStatus status;
  AuthState({
    this.status = RequestStatus.init,
  });

  AuthState copyWith({
    RequestStatus? status,
  }) {
    return AuthState(
      status: status ?? this.status,
    );
  }
}
