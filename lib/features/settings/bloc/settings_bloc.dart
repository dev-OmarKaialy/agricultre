import 'package:bloc/bloc.dart';
import 'package:first_app/core/shared/request_status.dart';
import 'package:first_app/core/shared/toaster.dart';
import 'package:first_app/features/settings/data/repo/settings_repo.dart';
import 'package:meta/meta.dart';

import '../../care/data/models/care_model.dart';
import '../../illusion/data/models/illusion_model.dart';
import '../../storage/data/models/storage_model.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState()) {
    on<IndexAgrisEvent>((event, emit) async {
      emit(state.copyWith(agrisStatus: RequestStatus.loading));
      final result = await SettingsRepo().indexAgris();
      result.fold((l) {
        emit(state.copyWith(agrisStatus: RequestStatus.failed));
      }, (r) {
        emit(state.copyWith(agrisStatus: RequestStatus.success, agris: r.doc));
      });
    });
    on<IndexIllusionEvent>((event, emit) async {
      emit(state.copyWith(illusionsStatus: RequestStatus.loading));
      final result = await SettingsRepo().getIllusions();
      result.fold((l) {
        emit(state.copyWith(illusionsStatus: RequestStatus.failed));
      }, (r) {
        emit(state.copyWith(
            illusionsStatus: RequestStatus.success, illusions: r.doc));
      });
    });
    on<IndexStorageEvent>((event, emit) async {
      emit(state.copyWith(storageStatus: RequestStatus.loading));
      final result = await SettingsRepo().indexstorage();
      result.fold((l) {
        emit(state.copyWith(storageStatus: RequestStatus.failed));
      }, (r) {
        emit(state.copyWith(
            storageStatus: RequestStatus.success, storages: r.doc));
      });
    });
    on<IndexCaresEvent>((event, emit) async {
      emit(state.copyWith(caresStatus: RequestStatus.loading));
      final result = await SettingsRepo().indexCares();
      result.fold((l) {
        emit(state.copyWith(caresStatus: RequestStatus.failed));
      }, (r) {
        emit(state.copyWith(caresStatus: RequestStatus.success, cares: r.doc));
      });
    });
    on<DeleteAgrisEvent>((event, emit) async {
      Toaster.showLoading();
      final result = await SettingsRepo().deleteAgris(event.id);
      result.fold((l) {
        Toaster.showToast(l.message);
      }, (r) {
        emit(state.copyWith(
            agris: List.of(state.agris)
              ..removeWhere((e) {
                return e.id == event.id;
              })));
      });
      Toaster.closeLoading();
    });
    on<DeleteIllusionEvent>((event, emit) async {
      Toaster.showLoading();
      final result = await SettingsRepo().deleteIllusions(event.id);
      result.fold((l) {
        Toaster.showToast(l.message);
      }, (r) {
        emit(state.copyWith(
            illusions: List.of(state.illusions)
              ..removeWhere((e) {
                return e.id == event.id;
              })));
      });
      Toaster.closeLoading();
    });
    on<DeleteCaresEvent>((event, emit) async {
      Toaster.showLoading();
      final result = await SettingsRepo().deleteCares(event.id);
      result.fold((l) {
        Toaster.showToast(l.message);
      }, (r) {
        emit(state.copyWith(
            cares: List.of(state.cares)
              ..removeWhere((e) {
                return e.id == event.id;
              })));
      });
      Toaster.closeLoading();
    });
    on<DeleteStorageEvent>((event, emit) async {
      Toaster.showLoading();
      final result = await SettingsRepo().deleteStorage(event.id);
      result.fold((l) {
        Toaster.showToast(l.message);
      }, (r) {
        emit(state.copyWith(
            storages: List.of(state.storages)
              ..removeWhere((e) {
                return e.id == event.id;
              })));
      });
      Toaster.closeLoading();
    });
    on<CreateStorageEvent>((event, emit) async {
      Toaster.showLoading();
      final result =
          await SettingsRepo().createStorage(event.name, event.descriptino);
      result.fold((l) {
        Toaster.showToast(l.message);
      }, (r) {
        emit(
          state.copyWith(
            storages: List.of(state.storages)
              ..add(
                StorageModel.fromJson(r.doc!.toJson()),
              ),
          ),
        );
      });
      Toaster.closeLoading();
    });
    on<CreateCareEvent>((event, emit) async {
      Toaster.showLoading();
      final result =
          await SettingsRepo().createCare(event.name, event.descriptino);
      result.fold((l) {
        Toaster.showToast(l.message);
      }, (r) {
        emit(
          state.copyWith(
            cares: List.of(state.cares)
              ..add(
                CareModel.fromJson(r.doc!.toJson()),
              ),
          ),
        );
      });
      Toaster.closeLoading();
    });
    on<CreateAgriEvent>((event, emit) async {
      Toaster.showLoading();
      final result =
          await SettingsRepo().createAgri(event.name, event.descriptino);
      result.fold((l) {
        Toaster.showToast(l.message);
      }, (r) {
        emit(
          state.copyWith(
            agris: List.of(state.agris)
              ..add(
                CareModel.fromJson(r.doc!.toJson()),
              ),
          ),
        );
      });
      Toaster.closeLoading();
    });
    on<CreateIllusionEvent>((event, emit) async {
      Toaster.showLoading();
      final result = await SettingsRepo()
          .createIllusion(event.name, event.descriptino, event.photo);
      result.fold((l) {
        Toaster.showToast(l.message);
      }, (r) {
        emit(
          state.copyWith(
            illusions: List.of(state.illusions)..add(r.doc!),
          ),
        );
      });
      Toaster.closeLoading();
    });
  }
}
