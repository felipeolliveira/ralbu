import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/user_theme_enum.dart';
import '../../domain/entities/user_settings_entity.dart';
import '../../domain/usecases/get_user_settings_usecase.dart';
import '../../domain/usecases/save_user_settings_usecase.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetUserSettingsUseCase _getUserSettingsUseCase;
  final SaveUserSettingsUseCase _saveUserSettingsUseCase;

  SettingsBloc(this._getUserSettingsUseCase, this._saveUserSettingsUseCase)
      : super(InitialSettingsState()) {
    on<GetSettingsEvent>(_getSettings);
    on<SaveSettingsEvent>(_saveSettings);
  }

  _getSettings(GetSettingsEvent event, Emitter<SettingsState> emit) async {
    emit(GettingSettingsState());
    final settingsEither = await _getUserSettingsUseCase();

    if (settingsEither.isLeft()) {
      emit(GetFailedSettingsState());
      return;
    }

    final settings = settingsEither.fold((l) => null, (r) => r)!;
    emit(GetSuccessSettingsState(settings));
  }

  _saveSettings(SaveSettingsEvent event, Emitter<SettingsState> emit) async {
    emit(SavingSettingsState());
    final saveEither = await _saveUserSettingsUseCase(
      UserSettingsEntity(
        retroAchievementsKey: event.retroKey,
        username: event.username,
        systemColor: event.systemColor.value,
        theme: event.theme,
      ),
    );

    if (saveEither.isLeft()) {
      emit(SaveFailedSettingsState());
      return;
    }

    emit(SaveSuccessSettingsState(event.systemColor.value, event.theme.mode));
  }
}
