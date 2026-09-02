import 'dart:async';

import 'package:flutter/material.dart';

import '../models/quiz_category.dart';
import '../widgets/answer_tile.dart';
import '../widgets/fact_card.dart';
import '../widgets/timer_bar.dart';
import 'result_screen.dart';

/// Plays through every question of [category] one at a time, with a
/// per-question countdown timer and an instant right/wrong reveal.
class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.category});

  final QuizCategory category;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  static const int _secondsPerQuestion = 15;

  int _questionIndex = 0;
  int _score = 0;
  int? _selectedIndex;
  bool _answered = false;
  int _secondsLeft = _secondsPerQuestion;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _secondsLeft = _secondsPerQuestion;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsLeft <= 1) {
          _secondsLeft = 0;
          timer.cancel();
          if (!_answered) {
            // Time ran out: treat it as answering with no option selected.
            _selectAnswer(-1);
          }
        } else {
          _secondsLeft--;
        }
      });
    });
  }

  void _selectAnswer(int index) {
    if (_answered) return;
    final question = widget.category.questions[_questionIndex];
    setState(() {
      _answered = true;
      _selectedIndex = index;
      if (index == question.correctIndex) {
        _score++;
      }
    });
    _timer?.cancel();
  }

  void _nextQuestion() {
    final isLastQuestion = _questionIndex == widget.category.questions.length - 1;
    if (isLastQuestion) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ResultScreen(category: widget.category, score: _score),
        ),
      );
      return;
    }
    setState(() {
      _questionIndex++;
      _answered = false;
      _selectedIndex = null;
    });
    _startTimer();
  }

  AnswerState _stateFor(int index, int correctIndex) {
    if (!_answered) return AnswerState.neutral;
    if (index == correctIndex) return AnswerState.correct;
    if (index == _selectedIndex) return AnswerState.wrong;
    return AnswerState.disabled;
  }

  @override
  Widget build(BuildContext context) {
    final questions = widget.category.questions;
    final question = questions[_questionIndex];
    final total = questions.length;

    return Scaffold(
      appBar: AppBar(title: Text(widget.category.title)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question ${_questionIndex + 1}/$total',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '$_secondsLeft s',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _secondsLeft <= 5 ? Colors.red : Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TimerBar(progress: _secondsLeft / _secondsPerQuestion),
              const SizedBox(height: 20),
              Text(
                question.text,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < question.options.length; i++)
                        AnswerTile(
                          label: question.options[i],
                          state: _stateFor(i, question.correctIndex),
                          onTap: _answered ? null : () => _selectAnswer(i),
                        ),
                      if (_answered) FactCard(fact: question.funFact),
                    ],
                  ),
                ),
              ),
              if (_answered)
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _nextQuestion,
                    style: FilledButton.styleFrom(
                      backgroundColor: widget.category.color,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      _questionIndex == total - 1 ? 'See Results' : 'Next Question',
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
