import 'dart:math';

import 'package:flutter/material.dart';

import '../../../achievements_panel/domain/entities/console_entity.dart';
import '../../domain/entities/game_entity.dart';

class GameSelector extends StatefulWidget {
  const GameSelector({super.key});

  @override
  State<GameSelector> createState() => _GameSelectorState();
}

class _GameSelectorState extends State<GameSelector> {
  final ValueNotifier<int?> selectedConsoleId = ValueNotifier(null);
  final ValueNotifier<int?> selectedGameId = ValueNotifier(null);
  final ValueNotifier<List<GameEntity>> gamesPerConsole = ValueNotifier([]);

  Function() _handleSelectConsole(int consoleId) {
    return () {
      selectedGameId.value = null;
      selectedConsoleId.value = consoleId;
      gamesPerConsole.value = _gamesByConsoleId(consoleId);
    };
  }

  Function() _handleSelectGame(int gameId) {
    return () {
      selectedGameId.value = gameId;
    };
  }

  List<GameEntity> _gamesByConsoleId(int consoleId) {
    return games.where((game) => game.console.id == consoleId).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Card(
          color: theme.dialogBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: selectedConsoleId,
                    builder: (_, value, __) => Text('Console: $value'),
                  ),
                ),
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: selectedGameId,
                    builder: (_, value, __) => Text('Game: $value'),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text('Consoles'),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: consoles.length,
                        itemBuilder: (_, index) {
                          final console = consoles[index];

                          return InkWell(
                            onTap: _handleSelectConsole(console.id),
                            child: Card(
                              child: ListTile(
                                title: Text(
                                  console.name,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text('Jogos'),
                    ),
                    Expanded(
                      child: ValueListenableBuilder(
                          valueListenable: gamesPerConsole,
                          builder: (_, value, __) {
                            if (value.isEmpty) {
                              return Card(
                                color: theme.colorScheme.onSurface,
                                child: Center(
                                  child: selectedConsoleId.value == null
                                      ? const Text(
                                          'Selecione um console primeiro')
                                      : const Text(
                                          'Não existem jogos com conquistas para esse console'),
                                ),
                              );
                            }

                            return ListView.builder(
                              itemCount: value.length,
                              itemBuilder: (_, index) {
                                final game = value[index];

                                return InkWell(
                                  onTap: _handleSelectGame(game.id),
                                  child: Card(
                                    child: ListTile(
                                      title: Text(
                                        game.title,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.surface),
                  child: const Text('Cancelar'),
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: FilledButton(
                  onPressed: () {},
                  child: const Text('Aplicar'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

final consoles = List<ConsoleEntity>.generate(
    50, (index) => ConsoleEntity(id: index, name: "Console $index"));

final games = List.generate(
  100,
  (index) => GameEntity(
    title: "Elemental Master",
    id: index,
    console: ConsoleEntity(id: Random().nextInt(100), name: "Console $index"),
    imageIcon: "/Images/048245.png",
    numAchievements: 44,
    numLeaderboards: 0,
    points: 500,
    dateModified: DateTime.now(),
    forumTopicId: 1972,
    hashes: const ["32e1a15161ef1f070b023738353bde51"],
  ),
);
