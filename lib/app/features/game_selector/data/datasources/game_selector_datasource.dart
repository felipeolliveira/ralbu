import '../dto/console_dto.dart';
import '../dto/game_dto.dart';

abstract interface class GameSelectorLocalDatasource {
  (ConsoleDTO, GameDTO) getSelectedGameAndConsole();
  void saveSelectedGame(GameDTO game);
  void saveSelectedConsole(ConsoleDTO console);
}

abstract interface class GameSelectorRemoteDatasource {
  Future<ConsoleDTO> getAllConsoles();
  Future<GameDTO> getGameByConsoleId(String consoleId);
}
