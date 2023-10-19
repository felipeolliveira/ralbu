import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_settings_entity.dart';
import '../repositories/settings_repository.dart';

class SaveUserSettingsUseCaseParams {
  final UserSettingsEntity userSettings;

  SaveUserSettingsUseCaseParams(this.userSettings);
}

class SaveUserSettingsUseCase implements UseCase<void, UserSettingsEntity> {
  final SettingsRepository _repository;

  SaveUserSettingsUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(UserSettingsEntity userSettings) async {
    return await _repository.saveUserSettings(userSettings);
  }
}
