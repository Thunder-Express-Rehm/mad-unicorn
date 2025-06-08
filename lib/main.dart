import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Intro & Home
import 'pages/intro_page.dart';
import 'pages/home_page.dart';
import 'pages/settings_page.dart';

// Mission Pages
import 'pages/mission01_page.dart';
import 'pages/mission02_page.dart';
import 'pages/mission03_page.dart';
import 'pages/mission04_page.dart';
import 'pages/mission05_page.dart';
import 'pages/mission06_page.dart';
import 'pages/mission07_page.dart';
import 'pages/mission08_page.dart';
import 'pages/mission09_page.dart';
import 'pages/mission10_page.dart';
import 'pages/mission11_finale.dart';

// Decision Pages
import 'pages/mission02_decision_page.dart';
import 'pages/mission03_decision_page.dart';
import 'pages/mission04_decision_page.dart';
import 'pages/mission05_decision_page.dart';
import 'pages/mission06_decision_page.dart';
import 'pages/mission07_decision_page.dart';
import 'pages/mission08_decision_page.dart';
import 'pages/mission09_decision_page.dart';
import 'pages/mission10_decision_page.dart';

// Dashboard & Storylog
import 'pages/summary_dashboard.dart';
import 'pages/storylog_page.dart';
import 'pages/storylog_interactive_page.dart';

// Cutscene Comic
import 'pages/cutscene_page.dart';

// Globals
import 'utils/globals.dart';

void main() {
  runApp(MadUnicornApp());
}

class MadUnicornApp extends StatefulWidget {
  @override
  _MadUnicornAppState createState() => _MadUnicornAppState();
}

class _MadUnicornAppState extends State<MadUnicornApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    // Theme
    final isDark = prefs.getBool('isDarkMode') ?? true;
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });

    // Difficulty
    final savedDifficulty = prefs.getString('difficulty') ?? 'mittel';
    switch (savedDifficulty) {
      case 'leicht':
        currentDifficulty = Difficulty.leicht;
        break;
      case 'schwer':
        currentDifficulty = Difficulty.schwer;
        break;
      default:
        currentDifficulty = Difficulty.mittel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAD UNICORN - vom Kurier zum Logistik Milliardär',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.deepPurple,
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.deepPurple,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: '/cutscene',
      routes: {
        '/': (context) => IntroPage(),
        '/home': (context) => HomePage(),
        '/settings': (context) => SettingsPage(),

        // Cutscene
        '/cutscene': (context) => CutscenePage(),

        // Missions
        '/mission1': (context) => Mission01Page(),
        '/mission2': (context) => Mission02Page(),
        '/mission3': (context) => Mission03Page(),
        '/mission4': (context) => Mission04Page(),
        '/mission5': (context) => Mission05Page(),
        '/mission6': (context) => Mission06Page(),
        '/mission7': (context) => Mission07Page(),
        '/mission8': (context) => Mission08Page(),
        '/mission9': (context) => Mission09Page(),
        '/mission10': (context) => Mission10Page(),
        '/mission11': (context) => Mission11Finale(),

        // Decisions
        '/decision2': (context) => Mission02DecisionPage(),
        '/decision3': (context) => Mission03DecisionPage(),
        '/decision4': (context) => Mission04DecisionPage(),
        '/decision5': (context) => Mission05DecisionPage(),
        '/decision6': (context) => Mission06DecisionPage(),
        '/decision7': (context) => Mission07DecisionPage(),
        '/decision8': (context) => Mission08DecisionPage(),
        '/decision9': (context) => Mission09DecisionPage(),
        '/decision10': (context) => Mission10DecisionPage(),

        // Utilities
        '/summary': (context) => SummaryDashboard(outcome: 'Zusammenfassung wird geladen...'),
        '/storylog': (context) => StorylogPage(log: []),
        '/storylogInteractive': (context) => StorylogInteractivePage(),
      },
    );
  }
}
