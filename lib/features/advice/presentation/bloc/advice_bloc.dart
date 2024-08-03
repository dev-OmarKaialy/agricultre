import 'package:bloc/bloc.dart';
import 'package:first_app/core/shared/request_status.dart';
import 'package:first_app/features/advice/data/models/advice_model.dart';
import 'package:first_app/features/advice/data/repositories/advice_repo.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceState()) {
    on<GetAdvices>((event, emit) async {
      emit(state.copyWith(status: RequestStatus.loading));
      final result = await AdviceRepo().getAdvices();
      result.fold((left) {
        emit(state.copyWith(status: RequestStatus.failed));
      }, (right) {
        emit(state.copyWith(advices: right.doc, status: RequestStatus.success));
      });
    });
  }
}
