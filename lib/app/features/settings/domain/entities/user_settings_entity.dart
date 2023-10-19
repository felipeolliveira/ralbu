import 'package:equatable/equatable.dart';
import 'user_theme_enum.dart';

class UserSettingsEntity extends Equatable {
  final String retroAchievementsKey;
  final String username;
  final int systemColor;
  final UserThemeEnum theme;

  const UserSettingsEntity({
    required this.retroAchievementsKey,
    required this.username,
    required this.systemColor,
    required this.theme,
  });

  @override
  List<Object?> get props => [retroAchievementsKey];
}
