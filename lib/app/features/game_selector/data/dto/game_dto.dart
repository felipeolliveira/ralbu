// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../../core/dtos/dto.dart';
import '../../../achievements_panel/domain/entities/console_entity.dart';
import '../../domain/entities/game_entity.dart';
import 'console_dto.dart';

class GameDTO implements DTO<GameEntity> {
  final String title;
  final int id;
  final ConsoleDTO console;
  final String imageIcon;
  final int numAchievements;
  final int numLeaderboards;
  final num points;
  final String dateModified;
  final int forumTopicId;
  final List<String> hashes;

  GameDTO({
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
  GameEntity toDomain() {
    return GameEntity(
      title: title,
      id: id,
      console: console.toDomain(),
      imageIcon: imageIcon,
      numAchievements: numAchievements,
      numLeaderboards: numLeaderboards,
      points: points,
      dateModified: DateTime.parse(dateModified),
      forumTopicId: forumTopicId,
      hashes: hashes,
    );
  }

  factory GameDTO.fromMap(Map<String, dynamic> map) {
    return GameDTO(
      title: map['title'] as String,
      id: map['id'] as int,
      console: ConsoleDTO.fromMap(map['console'] as Map<String, dynamic>),
      imageIcon: map['imageIcon'] as String,
      numAchievements: map['numAchievements'] as int,
      numLeaderboards: map['numLeaderboards'] as int,
      points: map['points'] as num,
      dateModified: map['dateModified'] as String,
      forumTopicId: map['forumTopicId'] as int,
      hashes: List<String>.from(
        (map['hashes'] as List<String>),
      ),
    );
  }
}
