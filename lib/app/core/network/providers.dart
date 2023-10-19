import 'package:dio/dio.dart';

import '../constants.dart';

class NetworkProviders {
  static Dio get dio =>
      Dio(BaseOptions(baseUrl: Constants.retroAchievementsAPIURL));
}
