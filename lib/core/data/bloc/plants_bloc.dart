import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:bloc/bloc.dart';
import 'package:first_app/core/data/plants_repo.dart';
import 'package:meta/meta.dart';

part 'plants_event.dart';
part 'plants_state.dart';

class PlantsBloc extends Bloc<PlantsEvent, PlantsState> {
  PlantsBloc() : super(PlantsState()) {
    on<GetPlantsEvent>((event, emit) async {
      final result = await PlantsRepo().getAdverts();
      result.fold((l) {}, (r) {});
    });
    on<GetPlants2Event>((event, emit) async {
      final result = await PlantsRepo().getAdverts1();
      result.fold((l) {}, (r) {});
    });
    on<GetPlants3Event>((event, emit) async {
      final result = await PlantsRepo().getAdverts2('1');
      result.fold((l) {}, (r) {});
    });
  }
}
