import 'package:flutter/material.dart';

/// Visual state of an [AnswerTile] once the user has answered a question.
enum AnswerState { neutral, correct, wrong, disabled }

/// A single selectable answer option. Colors itself green/red once the
/// question has been answered, revealing which option was correct.
class AnswerTile extends StatelessWidget {
  const AnswerTile({
    super.key,
    required this.label,
    required this.state,
    required this.onTap,
  });

  final String label;
  final AnswerState state;
  final VoidCallback? onTap;

  Color get _backgroundColor {
    switch (state) {
      case AnswerState.correct:
        return const Color(0xFF00B894);
      case AnswerState.wrong:
        return const Color(0xFFD63031);
      case AnswerState.disabled:
        return Colors.grey.shade200;
      case AnswerState.neutral:
        return Colors.white;
    }
  }

  Color get _textColor {
    switch (state) {
      case AnswerState.correct:
      case AnswerState.wrong:
        return Colors.white;
      case AnswerState.disabled:
        return Colors.grey.shade500;
      case AnswerState.neutral:
        return Colors.black87;
    }
  }

  IconData? get _icon {
    switch (state) {
      case AnswerState.correct:
        return Icons.check_circle;
      case AnswerState.wrong:
        return Icons.cancel;
      case AnswerState.neutral:
      case AnswerState.disabled:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: state == AnswerState.neutral ? Colors.grey.shade300 : Colors.transparent,
        ),
        boxShadow: state == AnswerState.neutral
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ]
            : const [],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: _textColor,
                    ),
                  ),
                ),
                if (_icon != null) Icon(_icon, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
