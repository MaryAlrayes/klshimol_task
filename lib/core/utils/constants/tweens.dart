import 'package:flutter/animation.dart';

class TweenConstants {
  static final horizontalTween = Tween(
    begin: const Offset(1, 0),
    end: const Offset(0, 0),
  );

   static final verticalTween = Tween(
    begin: const Offset(0, 1),
    end: const Offset(0, 0),
  );
}
