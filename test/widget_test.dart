// Basic smoke tests for QuizVerse: category selection, answering a
// question, and reaching the result screen.

import 'package:flutter_test/flutter_test.dart';

import 'package:untitled/main.dart';

void main() {
  testWidgets('Home screen lists all quiz categories', (WidgetTester tester) async {
    await tester.pumpWidget(const QuizApp());

    expect(find.text('🧠 QuizVerse'), findsOneWidget);
    expect(find.text('Science'), findsOneWidget);
    expect(find.text('History'), findsOneWidget);
  });

  testWidgets('Selecting a category starts the quiz and shows a question', (WidgetTester tester) async {
    await tester.pumpWidget(const QuizApp());

    await tester.tap(find.text('Science'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Question 1/'), findsOneWidget);
  });

  testWidgets('Answering a question reveals the fun fact and Next button', (WidgetTester tester) async {
    await tester.pumpWidget(const QuizApp());

    await tester.tap(find.text('Science'));
    await tester.pumpAndSettle();

    // Tap the first answer option.
    await tester.tap(find.text('Mars').first);
    await tester.pump();

    expect(find.text('Did you know?'), findsOneWidget);
    expect(find.text('Next Question'), findsOneWidget);
  });
}
