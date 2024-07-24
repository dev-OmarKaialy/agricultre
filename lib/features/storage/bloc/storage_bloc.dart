import 'package:bloc/bloc.dart';
import 'package:first_app/features/storage/data/repo/storage_repo.dart';
import 'package:meta/meta.dart';

import '../../../core/shared/request_status.dart';
import '../data/models/storage_model.dart';

part 'storage_event.dart';
part 'storage_state.dart';

class StorageBloc extends Bloc<StorageEvent, StorageState> {
  List<StorageModel> storages = [];
  StorageBloc() : super(StorageState()) {
    on<SearchStoragesEvent>((event, emit) async {
      emit(state.copyWith(
          storages: List.of(storages)
              .where((e) => (e.name ?? '').contains(event.phrase))
              .toList()));
    });
    on<IndexStorageEvent>((event, emit) async {
      emit(state.copyWith(indexStatus: RequestStatus.loading));
      final result = await StorageRepo().indexStorage();
      result.fold((l) {
        emit(state.copyWith(indexStatus: RequestStatus.failed));
      }, (r) {
        storages = r.doc!;
        emit(state.copyWith(
            indexStatus: RequestStatus.success, storages: storages));
      });
    });
  }
}
