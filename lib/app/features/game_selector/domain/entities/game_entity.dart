import 'package:equatable/equatable.dart';

import '../../../achievements_panel/domain/entities/console_entity.dart';

class GameEntity extends Equatable {
  final String title;
  final int id;
  final ConsoleEntity console;
  final String imageIcon;
  final int numAchievements;
  final int numLeaderboards;
  final num points;
  final DateTime dateModified;
  final int forumTopicId;
  final List<String> hashes;

  const GameEntity({
    required this.title,
    required this.id,
    required this.console,
    required this.imageIcon,
    required this.numAchievements,
    required this.numLeaderboards,
    required this.points,
    required this.dateModified,
    required this.forumTopicId,
    required this.hashes,
  });

  @override
  List<Object?> get props => [
        title,
        id,
        console,
        imageIcon,
        numAchievements,
        numLeaderboards,
        points,
        dateModified,
        forumTopicId,
        hashes,
      ];
}
