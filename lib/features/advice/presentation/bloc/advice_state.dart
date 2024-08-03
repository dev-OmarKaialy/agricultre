part of 'advice_bloc.dart';

class AdviceState {
  final RequestStatus status;
  final List<AdviceModel> advices;
  AdviceState({
    this.status = RequestStatus.init,
    this.advices = const [],
  });

  AdviceState copyWith({
    RequestStatus? status,
    List<AdviceModel>? advices,
  }) {
    return AdviceState(
      status: status ?? this.status,
      advices: advices ?? this.advices,
    );
  }
}
