import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/settings/presentation/bloc/settings_bloc.dart';
import 'service_locator.dart';

class BlocProviders {
  static List<BlocProvider> get list => [
        BlocProvider<SettingsBloc>(
          create: (context) => ServiceLocator.inject<SettingsBloc>(),
        )
      ];
}
