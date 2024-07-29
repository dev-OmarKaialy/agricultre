part of 'agri_bloc.dart';

@immutable
abstract class AgriEvent {}

class IndexAgriEvent extends AgriEvent {}

class SearchAgriEvent extends AgriEvent {
  final String phrase;
  SearchAgriEvent({
    this.phrase = '',
  });
}
