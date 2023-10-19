import '../../../../core/errors/failure.dart';
import '../../domain/entities/user_settings_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/settings_repository.dart';
import '../datasources/local/settings_hive_datasource.dart';
import '../dtos/user_settings_dto.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsHiveLocalDataSource _localDataSource;

  SettingsRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, UserSettingsEntity>> getUserSettings() async {
    try {
      final settings = await _localDataSource.getSettings();
      return Right(settings.toDomain());
    } catch (e) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveUserSettings(
      UserSettingsEntity settings) async {
    try {
      await _localDataSource.saveSettings(UserSettingsDTO.fromDomain(settings));
      return const Right(null);
    } catch (e) {
      return Left(LocalFailure());
    }
  }
}
