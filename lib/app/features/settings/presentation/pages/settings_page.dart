import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user_theme_enum.dart';
import '../bloc/settings_bloc.dart';
import '../widgets/settings_section_widget.dart';
import '../widgets/system_color_picker_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _formKey = GlobalKey<FormState>();
  final _retroKeyController = TextEditingController();
  final _usernameController = TextEditingController();
  final _systemColor = ValueNotifier<Color>(Colors.transparent);
  final _systemTheme = ValueNotifier<UserThemeEnum>(UserThemeEnum.light);

  void _handleSaveSettings() {
    context.read<SettingsBloc>().add(
          SaveSettingsEvent(
            retroKey: _retroKeyController.text,
            username: _usernameController.text,
            systemColor: _systemColor.value,
            theme: _systemTheme.value,
          ),
        );
  }

  void _successSaving() {
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
      const SnackBar(
        content: Text('Configurações aplicadas'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    context.read<SettingsBloc>().add(GetSettingsEvent());
  }

  @override
  void dispose() {
    _retroKeyController.dispose();
    _usernameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is GetSuccessSettingsState) {
          _retroKeyController.text = state.setting.retroAchievementsKey;
          _usernameController.text = state.setting.username;
          _systemColor.value = Color(state.setting.systemColor);
          _systemTheme.value = state.setting.theme;
        }

        if (state is SaveSuccessSettingsState) {
          _successSaving();
        }
      },
      builder: (_, state) {
        if (state is GettingSettingsState || state is InitialSettingsState) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SettingSectionWidget(
                        title: 'Acesso',
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                hintText: 'Coloque a sua chave de acesso',
                                label: Text('Retro Achievements Web Key'),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _retroKeyController,
                              decoration: const InputDecoration(
                                hintText:
                                    'Coloque o seu nome de usuário exatamente como está no Retro Achievements',
                                label: Text('Nome de usuário'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 48),
                      SettingSectionWidget(
                        title: 'Preferências de tema',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Modo', style: theme.textTheme.labelMedium),
                            const SizedBox(height: 8),
                            ValueListenableBuilder(
                              valueListenable: _systemTheme,
                              builder: (context, value, child) {
                                return ToggleButtons(
                                  borderWidth: 2,
                                  renderBorder: false,
                                  borderRadius: BorderRadius.circular(10),
                                  onPressed: (index) {
                                    _systemTheme.value =
                                        UserThemeEnum.values[index];
                                  },
                                  isSelected: [
                                    _systemTheme.value == UserThemeEnum.dark,
                                    _systemTheme.value == UserThemeEnum.light,
                                  ],
                                  children: [
                                    Icon(
                                      Icons.dark_mode,
                                      color: theme.colorScheme.primary,
                                    ),
                                    Icon(
                                      Icons.light_mode,
                                      color: theme.colorScheme.primary,
                                    ),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: 24),
                            Text('Cor principal',
                                style: theme.textTheme.labelMedium),
                            const SizedBox(height: 8),
                            ValueListenableBuilder(
                              valueListenable: _systemColor,
                              builder: (_, value, __) {
                                return SystemColorPickerWidget(
                                  selectedColor: value,
                                  onChangeColor: (newColor) =>
                                      _systemColor.value = newColor,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey.shade500,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Fechar'),
                  ),
                ),
                const SizedBox(width: 32),
                Expanded(
                  flex: 2,
                  child: FilledButton.tonal(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        _handleSaveSettings();
                      }
                    },
                    child: SaveButton(state: state),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}

class SaveButton extends StatelessWidget {
  final SettingsState state;
  const SaveButton({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state is SavingSettingsState) {
      return const SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 3.0,
        ),
      );
    }
    if (state is SaveFailedSettingsState) {
      return const Text('Tentar novamente');
    }
    return const Text('Salvar');
  }
}
