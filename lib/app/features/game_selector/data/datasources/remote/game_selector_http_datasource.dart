import '../../../../../core/network/http_client.dart';
import '../../dto/console_dto.dart';
import '../../dto/game_dto.dart';
import '../game_selector_datasource.dart';

class GameSelectorHttpDataSource implements GameSelectorRemoteDatasource {
  final HttpClient _httpClient;

  GameSelectorHttpDataSource(this._httpClient);

  @override
  Future<ConsoleDTO> getAllConsoles() async {
    return ConsoleDTO(id: 0, name: 'Teste');
  }

  @override
  Future<GameDTO> getGameByConsoleId(String consoleId) async {
    return GameDTO(
      title: 'title',
      id: 0,
      console: ConsoleDTO(id: 0, name: '0'),
      imageIcon: 'imageIcon',
      numAchievements: 0,
      numLeaderboards: 0,
      points: 0,
      dateModified: 'dateModified',
      forumTopicId: 0,
      hashes: [],
    );
  }
}
