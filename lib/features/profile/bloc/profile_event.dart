part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class UpdatePasswordEvent extends ProfileEvent {
  final UpdatePasswordParams params;
  UpdatePasswordEvent({
    required this.params,
  });
}

class LogoutEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final UpdateProfileParams params;
  UpdateProfileEvent({
    required this.params,
  });
}
