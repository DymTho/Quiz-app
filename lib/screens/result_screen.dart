import 'package:flutter/material.dart';

import '../models/quiz_category.dart';
import '../services/score_service.dart';
import 'quiz_screen.dart';

/// Shows the final score for a finished quiz, a performance message, the
/// category's persisted best score, and options to retry or go back.
class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.category, required this.score});

  final QuizCategory category;
  final int score;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool _isNewBest = false;
  int _bestScore = 0;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _saveScore();
  }

  Future<void> _saveScore() async {
    final isNewBest = await ScoreService.saveBestScoreIfHigher(widget.category.id, widget.score);
    final bestScore = await ScoreService.getBestScore(widget.category.id);
    if (!mounted) return;
    setState(() {
      _isNewBest = isNewBest;
      _bestScore = bestScore;
      _loading = false;
    });
  }

  String get _message {
    final ratio = widget.score / widget.category.questions.length;
    if (ratio == 1) return 'Perfect score! You are a true QuizVerse master! 🏆';
    if (ratio >= 0.7) return 'Great job! You really know your stuff. 🎉';
    if (ratio >= 0.4) return 'Not bad! A bit more practice and you will nail it. 💪';
    return 'Keep learning — every quiz makes you sharper! 📚';
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.category.questions.length;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.category.icon, size: 64, color: widget.category.color),
              const SizedBox(height: 16),
              Text(
                widget.category.title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                '${widget.score} / $total',
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                _message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),
              if (!_loading)
                Text(
                  _isNewBest ? '🌟 New best score!' : 'Best score: $_bestScore / $total',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: _isNewBest ? Colors.green.shade700 : Colors.grey.shade600,
                  ),
                ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => QuizScreen(category: widget.category),
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: widget.category.color,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Try Again'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Back to Categories'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
