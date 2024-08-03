import 'package:first_app/core/cubit/advertisment_cubit.dart';
import 'package:first_app/features/auth/bloc/auth_bloc.dart';
import 'package:first_app/features/care/bloc/care_bloc.dart';
import 'package:first_app/features/chat/bloc/chat_bloc.dart';
import 'package:first_app/features/illusion/bloc/illusion_bloc.dart';
import 'package:first_app/features/settings/bloc/settings_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/advice/presentation/bloc/advice_bloc.dart';
import '../../features/agriculture/bloc/agri_bloc.dart';
import '../../features/profile/bloc/profile_bloc.dart';
import '../../features/storage/bloc/storage_bloc.dart';

final serviceLocator = GetIt.instance;
Future<void> init() async {
  serviceLocator.registerLazySingleton<AuthBloc>(() => AuthBloc());
  serviceLocator.registerLazySingleton<ProfileBloc>(() => ProfileBloc());
  serviceLocator.registerLazySingleton<CareBloc>(() => CareBloc());
  serviceLocator.registerLazySingleton<StorageBloc>(() => StorageBloc());
  serviceLocator.registerLazySingleton<IllusionBloc>(() => IllusionBloc());
  serviceLocator.registerLazySingleton<ChatBloc>(() => ChatBloc());
  serviceLocator.registerLazySingleton<AgriBloc>(() => AgriBloc());
  serviceLocator.registerLazySingleton<SettingsBloc>(() => SettingsBloc());
  serviceLocator.registerLazySingleton<AdviceBloc>(() => AdviceBloc());
  serviceLocator
      .registerLazySingleton<AdvertismentCubit>(() => AdvertismentCubit());
}
