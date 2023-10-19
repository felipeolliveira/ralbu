part of 'settings_bloc.dart';

sealed class SettingsEvent {}

final class GetSettingsEvent extends SettingsEvent {}

final class SaveSettingsEvent extends SettingsEvent {
  final String retroKey;
  final String username;
  final Color systemColor;
  final UserThemeEnum theme;
  SaveSettingsEvent({
    required this.retroKey,
    required this.username,
    required this.systemColor,
    required this.theme,
  });
}

final class ResetInitialSettingsEvent extends SettingsEvent {}
