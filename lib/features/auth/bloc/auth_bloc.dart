import 'package:bloc/bloc.dart';
import 'package:first_app/core/shared/request_status.dart';
import 'package:first_app/core/shared/shared_preferences_service.dart';
import 'package:first_app/core/shared/toaster.dart';
import 'package:first_app/features/auth/data/usecases/login_usecase.dart';
import 'package:first_app/features/auth/data/usecases/signup_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final loginUsecase = LoginUsecase();
  final signupUsecase = SignupUsecase();
  AuthBloc() : super(AuthState()) {
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(status: RequestStatus.loading));
      final result = await loginUsecase.call(event.params);
      result.fold((l) {
        Toaster.showToast(l.message, isError: true);

        emit(state.copyWith(status: RequestStatus.failed));
      }, (r) {
        SharedPreferencesService.storeToken(r.token!);
        SharedPreferencesService.storeType(r.user!.role!);
        emit(state.copyWith(status: RequestStatus.success));
      });
    });
    on<SignUpEvent>((event, emit) async {
      emit(state.copyWith(status: RequestStatus.loading));
      final result = await signupUsecase.call(event.params);
      result.fold((l) {
        Toaster.showToast(l.message, isError: true);
        emit(state.copyWith(status: RequestStatus.failed));
      }, (r) {
        SharedPreferencesService.storeToken(r.token!);
        emit(state.copyWith(status: RequestStatus.success));
      });
    });
  }
}
