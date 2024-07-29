part of 'agri_bloc.dart';

class AgriState {
  final RequestStatus indexStatus;
  final List<CareModel> agris;
  AgriState({
    this.indexStatus = RequestStatus.init,
    this.agris = const [],
  });

  AgriState copyWith({
    RequestStatus? indexStatus,
    List<CareModel>? agris,
  }) {
    return AgriState(
      indexStatus: indexStatus ?? this.indexStatus,
      agris: agris ?? this.agris,
    );
  }
}
