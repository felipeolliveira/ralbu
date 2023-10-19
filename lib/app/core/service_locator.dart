import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../features/settings/data/datasources/local/settings_hive_datasource.dart';
import '../features/settings/data/dtos/user_settings_dto.dart';
import '../features/settings/data/repositories/settings_repository_impl.dart';
import '../features/settings/domain/repositories/settings_repository.dart';
import '../features/settings/domain/usecases/get_user_settings_usecase.dart';
import '../features/settings/domain/usecases/save_user_settings_usecase.dart';
import '../features/settings/presentation/bloc/settings_bloc.dart';
import 'constants.dart';
import 'network/http_client.dart';
import 'network/http_client_impl.dart';
import 'network/providers.dart';

class ServiceLocator {
  ServiceLocator._();
  static final _getIt = GetIt.instance;

  static GetIt get inject => _getIt;

  static Future<void> init() async {
    _registerInstrumentation();
    _registerLocalDatabase();
    _registerDataSources();
    _registerRepositories();
    _registerUseCases();
    _registerBlocs();
  }

  static Future<void> _registerInstrumentation() async {
    inject.registerSingleton(NetworkProviders.dio);
    inject.registerSingleton<HttpClient>(
      HttpDioClientImpl(baseUrl: Constants.retroAchievementsAPIURL),
    );
  }

  static Future<void> _registerLocalDatabase() async {
    await Hive.initFlutter();

    Hive.registerAdapter(UserSettingsDTOAdapter());
  }

  static Future<void> _registerDataSources() async {
    inject.registerSingleton<SettingsHiveLocalDataSource>(
        SettingsHiveLocalDataSource());
  }

  static Future<void> _registerRepositories() async {
    inject.registerSingleton<SettingsRepository>(
        SettingsRepositoryImpl(inject()));
  }

  static Future<void> _registerUseCases() async {
    inject.registerSingleton<GetUserSettingsUseCase>(
        GetUserSettingsUseCase(inject()));
    inject.registerSingleton<SaveUserSettingsUseCase>(
        SaveUserSettingsUseCase(inject()));
  }

  static Future<void> _registerBlocs() async {
    inject
        .registerFactory<SettingsBloc>(() => SettingsBloc(inject(), inject()));
  }
}
