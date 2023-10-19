import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_settings_entity.dart';
import '../repositories/settings_repository.dart';

class GetUserSettingsUseCase implements UseCase<UserSettingsEntity, String> {
  final SettingsRepository _repository;

  GetUserSettingsUseCase(this._repository);

  @override
  Future<Either<Failure, UserSettingsEntity>> call([void params]) async {
    return _repository.getUserSettings();
  }
}
