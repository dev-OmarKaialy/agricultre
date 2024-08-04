part of 'plants_bloc.dart';

@immutable
sealed class PlantsEvent {}

class GetPlantsEvent extends PlantsEvent {}

class GetPlants2Event extends PlantsEvent {}

class GetPlants3Event extends PlantsEvent {}
