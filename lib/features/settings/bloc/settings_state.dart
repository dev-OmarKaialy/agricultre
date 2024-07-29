part of 'settings_bloc.dart';

class SettingsState {
  final RequestStatus agrisStatus;
  final RequestStatus storageStatus;
  final RequestStatus caresStatus;
  final RequestStatus illusionsStatus;
  final List<CareModel> cares;
  final List<CareModel> agris;
  final List<StorageModel> storages;
  final List<IllusionModel> illusions;
  SettingsState({
    this.agrisStatus = RequestStatus.init,
    this.storageStatus = RequestStatus.init,
    this.caresStatus = RequestStatus.init,
    this.illusionsStatus = RequestStatus.init,
    this.cares = const [],
    this.agris = const [],
    this.storages = const [],
    this.illusions = const [],
  });

  SettingsState copyWith({
    RequestStatus? agrisStatus,
    RequestStatus? storageStatus,
    RequestStatus? caresStatus,
    RequestStatus? illusionsStatus,
    List<CareModel>? cares,
    List<CareModel>? agris,
    List<StorageModel>? storages,
    List<IllusionModel>? illusions,
  }) {
    return SettingsState(
      agrisStatus: agrisStatus ?? this.agrisStatus,
      storageStatus: storageStatus ?? this.storageStatus,
      caresStatus: caresStatus ?? this.caresStatus,
      illusionsStatus: illusionsStatus ?? this.illusionsStatus,
      cares: cares ?? this.cares,
      agris: agris ?? this.agris,
      storages: storages ?? this.storages,
      illusions: illusions ?? this.illusions,
    );
  }
}
