import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class TextPaints {
  static TextPaint get hideText => TextPaint(
        config: const TextPaintConfig(
          color: Colors.transparent,
        ),
      );

  static TextPaint get showSmallWhiteText => TextPaint(
        config: const TextPaintConfig(
          color: Colors.white,
          fontSize: 22,
          fontFamily: 'Butterfly',
        ),
      );
}
