// lib/utils/globals.dart

import 'package:flutter/material.dart';

/// Schwierigkeitsgrade
enum Difficulty { leicht, mittel, schwer }

/// Aktuell gewählter Schwierigkeitsgrad (Standard: mittel)
Difficulty currentDifficulty = Difficulty.mittel;

/// Fortschrittsdaten (können z. B. in SharedPreferences gespeichert/geladen werden)
int currentMissionIndex = 0;
List<String> completedMissions = [];

/// Globale Storylog-Variable (zum Mitschreiben von Entscheidungen & Missionen)
List<String> storyLog = [];

/// Globale Theme-Farbe (optional, für einheitliche Gestaltung)
const Color primaryColor = Colors.deepPurple;

/// Globale Schlüssel für SharedPreferences
const String prefsDifficultyKey = 'difficulty';
const String prefsThemeModeKey = 'isDarkMode';
const String prefsMissionIndexKey = 'currentMission';
const String prefsCompletedMissionsKey = 'completedMissions';
const String prefsStoryLogKey = 'storyLog';

/// Reset-Funktion für alle globalen Daten (z. B. beim Spielneustart)
void resetGlobals() {
  currentDifficulty = Difficulty.mittel;
  currentMissionIndex = 0;
  completedMissions.clear();
  storyLog.clear();
}
