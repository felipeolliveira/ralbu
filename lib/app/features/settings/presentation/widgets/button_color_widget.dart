import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ColorButtonWidget extends StatefulWidget {
  final Color color;
  final num size;
  final bool isSelected;
  final void Function(Color color)? onPressed;
  const ColorButtonWidget(
      {super.key,
      required this.color,
      this.size = 40,
      this.isSelected = false,
      this.onPressed});

  @override
  State<ColorButtonWidget> createState() => _ColorButtonWidgetState();
}

class _ColorButtonWidgetState extends State<ColorButtonWidget> {
  bool isHover = false;

  void Function(dynamic)? _onMouseHover(bool isEnter) {
    return (pointer) => setState(() {
          isHover = isEnter;
        });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final borderRadius = BorderRadius.circular(
      widget.size.toDouble(),
    );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(
          color: isHover || widget.isSelected
              ? colorScheme.primary
              : Colors.transparent,
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Material(
          child: InkWell(
            onTap: () => widget.onPressed?.call(widget.color),
            child: MouseRegion(
              onEnter: _onMouseHover(true),
              onExit: _onMouseHover(false),
              child: Ink(
                width: widget.size.toDouble(),
                height: widget.size.toDouble(),
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: borderRadius,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
