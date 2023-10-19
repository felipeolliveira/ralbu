class GameEntity {
  final String title;
  final int id;
  final int consoleId;
  final String consoleName;
  final String imageIcon;
  final int numAchievements;
  final int numLeaderboards;
  final int points;
  final String dateModified;
  final int forumTopicId;
  final List<String> hashes;

  GameEntity({
    required this.title,
    required this.id,
    required this.consoleId,
    required this.consoleName,
    required this.imageIcon,
    required this.numAchievements,
    required this.numLeaderboards,
    required this.points,
    required this.dateModified,
    required this.forumTopicId,
    required this.hashes,
  });
}
