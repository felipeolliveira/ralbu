import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/user_settings_entity.dart';

abstract class SettingsRepository {
  Future<Either<Failure, UserSettingsEntity>> getUserSettings();
  Future<Either<Failure, void>> saveUserSettings(UserSettingsEntity settings);
}
