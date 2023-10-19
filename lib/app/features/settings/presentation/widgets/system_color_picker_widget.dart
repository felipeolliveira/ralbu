import 'package:flutter/material.dart';

import 'button_color_widget.dart';

class SystemColorPickerWidget extends StatefulWidget {
  final Color selectedColor;
  final void Function(Color color)? onChangeColor;
  const SystemColorPickerWidget({
    super.key,
    required this.selectedColor,
    this.onChangeColor,
  });

  @override
  State<SystemColorPickerWidget> createState() =>
      _SystemColorPickerWidgetState();
}

class _SystemColorPickerWidgetState extends State<SystemColorPickerWidget> {
  final List<Color> _availableColors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepOrange,
    Colors.pink,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.cyanAccent,
    Colors.tealAccent,
    Colors.lightGreen,
  ];

  List<Widget> get _colorButtons {
    return _availableColors
        .map(
          (color) => ColorButtonWidget(
            color: color,
            isSelected: color.value == widget.selectedColor.value,
            onPressed: widget.onChangeColor,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: _colorButtons,
    );
  }
}
