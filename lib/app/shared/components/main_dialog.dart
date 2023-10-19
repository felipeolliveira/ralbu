import 'package:flutter/material.dart';

class MainDialogOptions {
  final bool barrierDismissible;
  final Color? barrierColor;
  final String? barrierLabel;
  final bool useSafeArea;
  final bool useRootNavigator;
  final RouteSettings? routeSettings;
  final Offset? anchorPoint;
  final TraversalEdgeBehavior? traversalEdgeBehavior;
  final double heightFactor;
  final double widthFactor;
  final BoxConstraints? constraints;
  final AlignmentGeometry? alignment;
  final EdgeInsets? insetPadding;

  const MainDialogOptions({
    this.barrierDismissible = true,
    this.barrierColor = Colors.black54,
    this.barrierLabel,
    this.useSafeArea = true,
    this.useRootNavigator = true,
    this.routeSettings,
    this.anchorPoint,
    this.traversalEdgeBehavior,
    this.heightFactor = 0.9,
    this.widthFactor = 0.8,
    this.alignment,
    this.insetPadding,
    this.constraints = const BoxConstraints(
      maxWidth: 800,
      minHeight: 300,
    ),
  });
}

class MainDialog {
  MainDialog._();

  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    MainDialogOptions options = const MainDialogOptions(),
  }) {
    return showDialog<T>(
      context: context,
      barrierColor: options.barrierColor,
      barrierLabel: options.barrierLabel,
      useSafeArea: options.useSafeArea,
      useRootNavigator: options.useRootNavigator,
      routeSettings: options.routeSettings,
      anchorPoint: options.anchorPoint,
      traversalEdgeBehavior: options.traversalEdgeBehavior,
      builder: (_) {
        final theme = Theme.of(context);
        final sizeOf = MediaQuery.sizeOf(context);
        const radiusSize = 20.0;

        return Dialog(
          insetPadding: options.insetPadding,
          alignment: options.alignment,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusSize),
          ),
          child: Container(
            constraints: options.constraints,
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(radiusSize),
            ),
            width: sizeOf.width * options.widthFactor,
            height: sizeOf.height * options.heightFactor,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radiusSize),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MainDialogContainer extends StatelessWidget {
  const _MainDialogContainer();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
