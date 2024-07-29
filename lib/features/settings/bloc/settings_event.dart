part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class IndexAgrisEvent extends SettingsEvent {}

class IndexCaresEvent extends SettingsEvent {}

class IndexIllusionEvent extends SettingsEvent {}

class IndexStorageEvent extends SettingsEvent {}

class DeleteStorageEvent extends SettingsEvent {
  final String id;
  DeleteStorageEvent({
    required this.id,
  });
}

class DeleteAgrisEvent extends SettingsEvent {
  final String id;
  DeleteAgrisEvent({
    required this.id,
  });
}

class DeleteIllusionEvent extends SettingsEvent {
  final String id;
  DeleteIllusionEvent({
    required this.id,
  });
}

class DeleteCaresEvent extends SettingsEvent {
  final String id;
  DeleteCaresEvent({
    required this.id,
  });
}
