import 'package:flutter/material.dart';

class BorderTileEntity {
  final double borderRadius;
  final double borderWeight;
  final Color borderColor;

  BorderTileEntity({
    required this.borderRadius,
    required this.borderWeight,
    required this.borderColor,
  });
}

class TilesEntity {
  final double size;
  final BorderTileEntity normalBorder;
  final BorderTileEntity hardcoreBorder;

  TilesEntity({
    required this.size,
    required this.normalBorder,
    required this.hardcoreBorder,
  });
}

class UiConfigEntity {
  final TilesEntity tiles;
  final Color backgroundColor;
  final double spacing;

  UiConfigEntity({
    required this.tiles,
    required this.backgroundColor,
    required this.spacing,
  });
}
