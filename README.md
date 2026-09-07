# 🧠 QuizVerse

A multi-category trivia quiz app built with **Flutter**, developed as part of a mobile
development course assignment.

QuizVerse goes beyond the basic tutorial quiz: it adds multiple categories, a
countdown timer, instant right/wrong feedback, a "Did you know?" fun fact after every
question, and persisted best scores per category.

## ✨ Features

- **6 quiz categories** — General Knowledge, Science, History, Geography, Movies & TV,
  and Sports — 48 questions in total.
- **15-second countdown timer** per question, with a color-shifting progress bar
  (green → amber → red). Running out of time counts as a wrong answer.
- **Instant feedback** — the correct answer is highlighted in green, a wrong pick in
  red, right after you tap.
- **"Did you know?"** — a fun fact related to the topic is revealed after every
  answered question.
- **Score tracking** — a results screen with a performance message tailored to how
  well you did.
- **Persisted best scores** — each category's best score is saved on-device with
  `shared_preferences`, so you can try to beat your own record.

## 🏗️ Architecture & Folder Structure

The app follows a simple layered structure that separates data, business logic, and UI:

```
lib/
├── main.dart                  # App entry point, MaterialApp setup
├── models/
│   ├── question.dart          # Question: text, options, correct answer, fun fact
│   └── quiz_category.dart     # QuizCategory: id, title, icon, color, questions
├── data/
│   └── quiz_data.dart         # Static content: all categories and their questions
├── services/
│   └── score_service.dart     # Persists/reads each category's best score
├── theme/
│   └── app_theme.dart         # Centralized color palette and ThemeData
├── screens/
│   ├── home_screen.dart       # Category selection grid
│   ├── quiz_screen.dart       # Question flow: timer, answers, fact reveal
│   └── result_screen.dart     # Final score, message, best score, retry/back
└── widgets/
    ├── category_card.dart     # Gradient card for a category on the home screen
    ├── answer_tile.dart       # A single selectable answer option
    ├── fact_card.dart         # "Did you know?" banner
    └── timer_bar.dart         # Countdown progress bar
```

### Key classes

| Class | Responsibility |
|---|---|
| `Question` | Immutable data holder for one question: text, options, correct answer index, and fun fact. |
| `QuizCategory` | Groups a themed set of questions with a title, icon, and color used throughout the UI. |
| `ScoreService` | Static helper around `shared_preferences` to read/save the best score per category. |
| `HomeScreen` | Displays all categories in a grid; navigates to `QuizScreen` on tap. |
| `QuizScreen` | Stateful screen driving the whole quiz: countdown timer (`Timer.periodic`), answer selection, scoring, and navigation to results. |
| `ResultScreen` | Shows the final score, a message based on performance, saves/loads the best score, and offers "Try Again" / "Back to Categories". |

### Main functions (in `_QuizScreenState`)

- `_startTimer()` — resets and starts the 15-second countdown for the current question.
- `_selectAnswer(index)` — locks in an answer, stops the timer, and updates the score.
- `_nextQuestion()` — advances to the next question or navigates to `ResultScreen` if it was the last one.
- `_stateFor(index, correctIndex)` — computes the visual state (neutral/correct/wrong/disabled) of each answer tile.

## 🛠️ Tech Stack

- **Flutter**  / **Dart**
- `shared_preferences` — lightweight on-device storage for best scores
- `flutter_test` — widget tests covering category selection, quiz flow, and answer feedback

## 🚀 Getting Started

1. Make sure the Flutter SDK is installed and `flutter doctor` reports no blocking issues.
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app on a connected device or emulator:
   ```bash
   flutter run
   ```

## ✅ Running Tests

```bash
flutter test
```

## 📱 How to Play

1. Pick a category from the home screen.
2. Answer each question before the 15-second timer runs out.
3. See the correct answer highlighted, read the fun fact, then move to the next question.
4. After the last question, check your score and try to beat your best!
