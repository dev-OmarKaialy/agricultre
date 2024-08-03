part of 'advice_bloc.dart';

abstract class AdviceEvent {
  const AdviceEvent();
}

class GetAdvices extends AdviceEvent {}
