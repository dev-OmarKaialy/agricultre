part of 'illusion_bloc.dart';

class IllusionState {
  final RequestStatus indexStatus;
  final List<IllusionModel> illusions;
  IllusionState({
    this.indexStatus = RequestStatus.init,
    this.illusions = const [],
  });

  IllusionState copyWith({
    RequestStatus? indexStatus,
    List<IllusionModel>? illusions,
  }) {
    return IllusionState(
      indexStatus: indexStatus ?? this.indexStatus,
      illusions: illusions ?? this.illusions,
    );
  }
}
