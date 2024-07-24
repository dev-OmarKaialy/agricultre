part of 'storage_bloc.dart';

class StorageState {
  final RequestStatus indexStatus;
  final List<StorageModel> storages;
  StorageState({
    this.indexStatus = RequestStatus.init,
    this.storages = const [],
  });

  StorageState copyWith({
    RequestStatus? indexStatus,
    List<StorageModel>? storages,
  }) {
    return StorageState(
      indexStatus: indexStatus ?? this.indexStatus,
      storages: storages ?? this.storages,
    );
  }
}
