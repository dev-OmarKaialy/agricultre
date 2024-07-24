import 'package:bloc/bloc.dart';
import 'package:first_app/core/shared/request_status.dart';
import 'package:first_app/core/shared/shared_preferences_service.dart';
import 'package:first_app/core/shared/toaster.dart';
import 'package:first_app/core/usecase/usecase.dart';
import 'package:first_app/features/auth/data/models/auth_model.dart';
import 'package:first_app/features/profile/data/usecases/update_password.dart';
import 'package:first_app/features/profile/data/usecases/update_profile.dart';
import 'package:meta/meta.dart';

import '../data/usecases/get_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final updatePasswordUsecase = UpdatePasswordUsecase();
  final updateProfileUsecase = UpdateProfileUsecase();
  final getProfileUsecase = GetProfileUsecase();
  ProfileBloc() : super(ProfileState()) {
    on<GetProfileEvent>((event, emit) async {
      emit(state.copyWith(getProfileStatus: RequestStatus.loading));
      final result = await getProfileUsecase.call(NoParams());
      result.fold((left) {
        Toaster.showToast(left.message, isError: true);
        emit(state.copyWith(getProfileStatus: RequestStatus.failed));
      }, (r) {
        emit(state.copyWith(
            getProfileStatus: RequestStatus.success, user: r.doc));
      });
    });
    on<UpdatePasswordEvent>((event, emit) async {
      emit(state.copyWith(profileStatus: RequestStatus.loading));
      final result = await updatePasswordUsecase.call(event.params);
      result.fold((left) {
        Toaster.showToast(left.message, isError: true);
        emit(state.copyWith(profileStatus: RequestStatus.failed));
      }, (r) {
        SharedPreferencesService.storeToken(r.token!);
        emit(
            state.copyWith(profileStatus: RequestStatus.success, user: r.user));
      });
      emit(state.copyWith(profileStatus: RequestStatus.init));
    });
    on<UpdateProfileEvent>((event, emit) async {
      emit(state.copyWith(profileStatus: RequestStatus.loading));
      final result = await updateProfileUsecase.call(event.params);
      result.fold((left) {
        Toaster.showToast(left.message, isError: true);
        emit(state.copyWith(profileStatus: RequestStatus.failed));
      }, (r) {
        emit(state.copyWith(
            profileStatus: RequestStatus.success, user: r.data?.user));
      });
      emit(state.copyWith(profileStatus: RequestStatus.init));
    });
    on<LogoutEvent>((event, emit) async {
      Toaster.showLoading();
      await SharedPreferencesService.clearAll();
      Toaster.closeLoading();
    });
  }
}
