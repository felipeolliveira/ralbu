class Constants {
  static const retroAchievementsBaseURL = 'https://retroachievements.org';
  static const retroAchievementsAPIURL = '$retroAchievementsBaseURL/API';

  static final boxes = _LocalDatabaseBoxes();
}

class _LocalDatabaseBoxes {
  final userSettings = 'user_settings';
}
