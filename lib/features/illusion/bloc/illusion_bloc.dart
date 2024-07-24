import 'package:bloc/bloc.dart';
import 'package:first_app/features/illusion/data/models/illusion_model.dart';
import 'package:first_app/features/illusion/data/repo/illusion_repo.dart';
import 'package:meta/meta.dart';

import '../../../core/shared/request_status.dart';

part 'illusion_event.dart';
part 'illusion_state.dart';

class IllusionBloc extends Bloc<IllusionEvent, IllusionState> {
  IllusionBloc() : super(IllusionState()) {
    on<IndexIllusionEvent>((event, emit) async {
      emit(state.copyWith(indexStatus: RequestStatus.loading));
      final result = await IllusionRepo().indexIllusions();
      result.fold((l) {
        emit(
          state.copyWith(indexStatus: RequestStatus.failed),
        );
      }, (r) {
        emit(
          state.copyWith(indexStatus: RequestStatus.success, illusions: r.doc),
        );
      });
    });
  }
}
