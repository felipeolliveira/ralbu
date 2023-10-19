import 'package:hive/hive.dart';

import '../../../../core/adapters/hide_adapters_ids.dart';
import '../../../../core/dtos/dto.dart';
import '../../domain/entities/user_theme_enum.dart';
import '../../domain/entities/user_settings_entity.dart';

part 'user_settings_dto.g.dart';

@HiveType(typeId: HiveAdapterIds.userSettings)
class UserSettingsDTO implements DTO<UserSettingsEntity> {
  @HiveField(0, defaultValue: '')
  final String retroAchievementsKey;
  @HiveField(1, defaultValue: 0)
  final int systemColor;
  @HiveField(2, defaultValue: 'dark')
  final String theme;
  @HiveField(3, defaultValue: '')
  final String username;

  UserSettingsDTO({
    required this.retroAchievementsKey,
    required this.username,
    required this.systemColor,
    required this.theme,
  });

  @override
  UserSettingsEntity toDomain() {
    return UserSettingsEntity(
      retroAchievementsKey: retroAchievementsKey,
      username: username,
      systemColor: systemColor,
      theme: UserThemeEnum.values.byName(theme),
    );
  }

  factory UserSettingsDTO.fromDomain(UserSettingsEntity userSettings) {
    return UserSettingsDTO(
      retroAchievementsKey: userSettings.retroAchievementsKey,
      username: userSettings.username,
      systemColor: userSettings.systemColor,
      theme: userSettings.theme.name,
    );
  }
}
