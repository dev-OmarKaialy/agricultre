part of 'advertisment_cubit.dart';

class AdvertismentState {
  final AdvertismnetModel? adverts;

  AdvertismentState({
    this.adverts,
  });

  AdvertismentState copyWith({
    AdvertismnetModel? adverts,
  }) {
    return AdvertismentState(
      adverts: adverts ?? this.adverts,
    );
  }
}
