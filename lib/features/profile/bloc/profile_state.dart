part of 'profile_bloc.dart';

class ProfileState {
  final RequestStatus profileStatus;
  final RequestStatus getProfileStatus;
  final UserModel? user;
  ProfileState({
    this.profileStatus = RequestStatus.init,
    this.getProfileStatus = RequestStatus.init,
    this.user,
  });

  ProfileState copyWith({
    RequestStatus? profileStatus,
    RequestStatus? getProfileStatus,
    UserModel? user,
  }) {
    return ProfileState(
      profileStatus: profileStatus ?? this.profileStatus,
      getProfileStatus: getProfileStatus ?? this.getProfileStatus,
      user: user ?? this.user,
    );
  }
}
