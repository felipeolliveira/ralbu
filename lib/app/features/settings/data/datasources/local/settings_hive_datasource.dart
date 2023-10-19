import 'package:hive/hive.dart';

import '../../../../../core/constants.dart';
import '../../dtos/user_settings_dto.dart';

class SettingsHiveLocalDataSource {
  Future<Box> _getBox() async {
    final isBoxOpen = Hive.isBoxOpen(Constants.boxes.userSettings);
    if (isBoxOpen) {
      return Hive.box(Constants.boxes.userSettings);
    }
    return Hive.openBox(Constants.boxes.userSettings);
  }

  Future<UserSettingsDTO> getSettings() async {
    final box = await _getBox();
    return box.get(Constants.boxes.userSettings);
  }

  Future<void> saveSettings(UserSettingsDTO userSettingsDTO) async {
    final box = await _getBox();
    await box.put(Constants.boxes.userSettings, userSettingsDTO);
  }
}
