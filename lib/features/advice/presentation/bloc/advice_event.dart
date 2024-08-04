part of 'advice_bloc.dart';

abstract class AdviceEvent {
  const AdviceEvent();
}

class GetAdvices extends AdviceEvent {}

class AddAdviceEvent extends AdviceEvent {
  final String advice;
  AddAdviceEvent({
    required this.advice,
  });
}

class UpdateAdviceEvent extends AdviceEvent {
  final String advice;
  final bool accept;
  UpdateAdviceEvent({
    required this.advice,
    this.accept = false,
  });
}
