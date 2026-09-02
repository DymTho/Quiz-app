import 'package:flutter/material.dart';

import 'question.dart';

/// A quiz category (e.g. "Science"), holding its own themed color, icon and
/// list of questions.
class QuizCategory {
  const QuizCategory({
    required this.id,
    required this.title,
    required this.icon,
    required this.color,
    required this.questions,
  });

  final String id;
  final String title;
  final IconData icon;
  final Color color;
  final List<Question> questions;
}
