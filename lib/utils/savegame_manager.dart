import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'globals.dart';

class SavegameManager {
  /// Fortschritt speichern
  static Future<void> saveProgress() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(prefsMissionIndexKey, currentMissionIndex);
    await prefs.setStringList(prefsCompletedMissionsKey, completedMissions);
    await prefs.setStringList(prefsStoryLogKey, storyLog);
    await prefs.setString(prefsDifficultyKey, currentDifficulty.name);
  }

  /// Fortschritt laden
  static Future<void> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();

    currentMissionIndex = prefs.getInt(prefsMissionIndexKey) ?? 0;
    completedMissions = prefs.getStringList(prefsCompletedMissionsKey) ?? [];
    storyLog = prefs.getStringList(prefsStoryLogKey) ?? [];

    final diffString = prefs.getString(prefsDifficultyKey);
    if (diffString != null) {
      currentDifficulty = _parseDifficulty(diffString);
    }
  }

  /// Fortschritt zurücksetzen
  static Future<void> resetProgress() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(prefsMissionIndexKey);
    await prefs.remove(prefsCompletedMissionsKey);
    await prefs.remove(prefsStoryLogKey);
    await prefs.remove(prefsDifficultyKey);

    resetGlobals();
  }

  /// Hilfsmethode zur Umwandlung
  static Difficulty _parseDifficulty(String value) {
    switch (value) {
      case 'leicht':
        return Difficulty.leicht;
      case 'mittel':
        return Difficulty.mittel;
      case 'schwer':
        return Difficulty.schwer;
      default:
        return Difficulty.mittel;
    }
  }
}
