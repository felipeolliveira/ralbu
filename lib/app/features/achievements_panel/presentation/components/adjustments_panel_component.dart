import 'package:flutter/material.dart';

import '../../../../shared/components/main_dialog.dart';
import '../../../game_selector/presentation/pages/game_selector.dart';
import '../../../settings/presentation/pages/settings_page.dart';

class AdjustmentsPanelComponent extends StatelessWidget {
  const AdjustmentsPanelComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        color: theme.colorScheme.onBackground,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Ajustes'),
                  FilledButton.tonal(
                    onPressed: () {
                      MainDialog.show(
                        context,
                        child: const SettingsPage(),
                      );
                    },
                    child: const Text('Configurações avançadas'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FilledButton.tonal(
                        onPressed: () {
                          MainDialog.show(
                            context,
                            options: const MainDialogOptions(
                              insetPadding: EdgeInsets.all(32),
                              constraints: BoxConstraints.expand(),
                            ),
                            child: const GameSelector(),
                          );
                        },
                        child: const Text('Escolha um jogo'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
