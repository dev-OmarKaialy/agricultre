part of 'storage_bloc.dart';

@immutable
abstract class StorageEvent {}

class IndexStorageEvent extends StorageEvent {}

class SearchStoragesEvent extends StorageEvent {
  final String phrase;
  SearchStoragesEvent({
    required this.phrase,
  });
}
