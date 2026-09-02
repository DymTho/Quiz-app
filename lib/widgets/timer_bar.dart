import 'package:flutter/material.dart';

/// A slim progress bar showing how much time is left for the current
/// question, shifting from green to amber to red.
class TimerBar extends StatelessWidget {
  const TimerBar({super.key, required this.progress});

  /// 1.0 = full time remaining, 0.0 = time is up.
  final double progress;

  Color get _color {
    if (progress > 0.5) return const Color(0xFF00B894);
    if (progress > 0.25) return const Color(0xFFFDCB6E);
    return const Color(0xFFD63031);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LinearProgressIndicator(
        value: progress.clamp(0.0, 1.0),
        minHeight: 8,
        backgroundColor: Colors.grey.shade200,
        valueColor: AlwaysStoppedAnimation<Color>(_color),
      ),
    );
  }
}
