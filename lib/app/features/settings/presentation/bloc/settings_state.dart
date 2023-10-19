part of 'settings_bloc.dart';

sealed class SettingsState {}

final class InitialSettingsState extends SettingsState {}

final class GettingSettingsState extends SettingsState {}

final class GetFailedSettingsState extends SettingsState {}

final class GetSuccessSettingsState extends SettingsState {
  final UserSettingsEntity setting;
  GetSuccessSettingsState(this.setting);
}

final class SavingSettingsState extends SettingsState {}

final class SaveFailedSettingsState extends SettingsState {}

final class SaveSuccessSettingsState extends SettingsState {
  final int systemColor;
  final ThemeMode themeMode;
  SaveSuccessSettingsState(this.systemColor, this.themeMode);
}
