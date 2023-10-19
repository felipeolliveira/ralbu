import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc_providers.dart';
import 'features/achievements_panel/presentation/pages/main_panel_page.dart';
import 'features/settings/presentation/bloc/settings_bloc.dart';
import 'shared/routes.dart';
import 'shared/theme/theme.dart';

class RalbuApp extends StatelessWidget {
  const RalbuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.list,
      child: const ThemedApp(),
    );
  }
}

class ThemedApp extends StatefulWidget {
  const ThemedApp({super.key});

  @override
  State<ThemedApp> createState() => _ThemedAppState();
}

class _ThemedAppState extends State<ThemedApp> {
  @override
  void initState() {
    super.initState();
    context.read<SettingsBloc>().add(GetSettingsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        AppTheme theme = AppTheme();
        ThemeMode mode = ThemeMode.system;

        if (state is GetSuccessSettingsState) {
          theme = AppTheme(Color(state.setting.systemColor));
          mode = state.setting.theme.mode;
        }

        if (state is SaveSuccessSettingsState) {
          theme = AppTheme(Color(state.systemColor));
          mode = state.themeMode;
        }

        return MaterialApp(
          title: 'Ralbu App',
          themeMode: mode,
          debugShowCheckedModeBanner: false,
          darkTheme: theme.dark,
          theme: theme.light,
          initialRoute: Routes.init,
          routes: {
            Routes.init: (context) => const MainPanelPage(),
          },
        );
      },
    );
  }
}
