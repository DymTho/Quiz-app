import 'package:shared_preferences/shared_preferences.dart';

/// Persists each category's best score on the device using SharedPreferences.
class ScoreService {
  ScoreService._();

  static String _keyFor(String categoryId) => 'best_score_$categoryId';

  static Future<int> getBestScore(String categoryId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyFor(categoryId)) ?? 0;
  }

  /// Saves [score] as the new best for [categoryId] if it beats the current
  /// best. Returns whether a new best score was set.
  static Future<bool> saveBestScoreIfHigher(String categoryId, int score) async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getInt(_keyFor(categoryId)) ?? 0;
    if (score > current) {
      await prefs.setInt(_keyFor(categoryId), score);
      return true;
    }
    return false;
  }
}
