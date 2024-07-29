import 'package:bloc/bloc.dart';
import 'package:first_app/core/shared/request_status.dart';
import 'package:first_app/features/agriculture/data/repo/agri_repo.dart';
import 'package:first_app/features/care/data/models/care_model.dart';
import 'package:meta/meta.dart';

part 'agri_event.dart';
part 'agri_state.dart';

class AgriBloc extends Bloc<AgriEvent, AgriState> {
  List<CareModel> agris = [];
  AgriBloc() : super(AgriState()) {
    on<SearchAgriEvent>((event, emit) {
      emit(state.copyWith(
          agris: List.of(agris).where((e) {
        return (e.name ?? '').contains(event.phrase);
      }).toList()));
    });
    on<IndexAgriEvent>((event, emit) async {
      emit(state.copyWith(indexStatus: RequestStatus.loading));
      final result = await AgriRepo().indexAgri();
      result.fold((l) {
        emit(state.copyWith(indexStatus: RequestStatus.failed));
      }, (r) {
        agris = r.doc!;
        emit(
          state.copyWith(indexStatus: RequestStatus.success, agris: agris),
        );
      });
    });
  }
}
