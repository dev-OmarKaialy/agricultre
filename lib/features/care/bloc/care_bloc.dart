import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/shared/request_status.dart';
import '../data/models/care_model.dart';
import '../data/repo/care_repo.dart';

part 'care_event.dart';
part 'care_state.dart';

class CareBloc extends Bloc<CareEvent, CareState> {
  List<CareModel> cares = [];
  CareBloc() : super(CareState()) {
    on<IndexCaresEvent>((event, emit) async {
      emit(state.copyWith(indexCareStatus: RequestStatus.loading));
      final result = await CareRepo().indexCares();
      result.fold((l) {
        emit(state.copyWith(indexCareStatus: RequestStatus.failed));
      }, (r) {
        cares = r.doc!;
        emit(
          state.copyWith(indexCareStatus: RequestStatus.success, cares: cares),
        );
      });
    });
    on<SearchCares>((event, emit) async {
      emit(state.copyWith(
          cares: List.of(cares)
              .where((e) => (e.name ?? '').contains(event.phrase))
              .toList()));
    });
  }
}
