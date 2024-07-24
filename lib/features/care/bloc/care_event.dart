part of 'care_bloc.dart';

@immutable
abstract class CareEvent {}

class IndexCaresEvent extends CareEvent {}

class SearchCares extends CareEvent {
  final String phrase;
  SearchCares({
    required this.phrase,
  });
}
