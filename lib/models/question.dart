/// A single trivia question with its answer options and a bonus fun fact
/// that is revealed once the user answers.
class Question {
  const Question({
    required this.text,
    required this.options,
    required this.correctIndex,
    required this.funFact,
  });

  final String text;
  final List<String> options;
  final int correctIndex;
  final String funFact;
}
