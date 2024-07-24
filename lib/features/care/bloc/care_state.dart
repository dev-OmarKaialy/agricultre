part of 'care_bloc.dart';

class CareState {
  final RequestStatus indexCareStatus;
  final List<CareModel> cares;
  CareState({
    this.indexCareStatus = RequestStatus.init,
    this.cares = const [],
  });

  CareState copyWith({
    RequestStatus? indexCareStatus,
    List<CareModel>? cares,
  }) {
    return CareState(
      indexCareStatus: indexCareStatus ?? this.indexCareStatus,
      cares: cares ?? this.cares,
    );
  }
}
