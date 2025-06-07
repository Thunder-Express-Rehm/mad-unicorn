import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/globals.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Difficulty _selectedDifficulty = currentDifficulty;
  bool _isDarkMode = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    // Schwierigkeitsgrad laden
    final savedValue = prefs.getString('difficulty') ?? 'mittel';
    _selectedDifficulty = _parseDifficulty(savedValue);
    currentDifficulty = _selectedDifficulty;

    // Theme laden
    final isDark = prefs.getBool('isDarkMode') ?? true;
    setState(() {
      _isDarkMode = isDark;
    });
  }

  Future<void> _saveDifficulty(Difficulty difficulty) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('difficulty', difficulty.name);
  }

  Future<void> _saveThemePreference(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDark);
  }

  Difficulty _parseDifficulty(String value) {
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

  void _updateDifficulty(Difficulty? value) {
    if (value != null) {
      setState(() {
        _selectedDifficulty = value;
        currentDifficulty = value;
      });
      _saveDifficulty(value);
    }
  }

  void _toggleTheme(bool isDark) {
    setState(() {
      _isDarkMode = isDark;
    });
    _saveThemePreference(isDark);
  }

  Future<void> _resetPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Alle Spielstände wurden zurückgesetzt.')),
    );

    await Future.delayed(Duration(milliseconds: 800));
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Einstellungen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '🔧 Schwierigkeitsgrad wählen:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('🟢 Leicht'),
              leading: Radio<Difficulty>(
                value: Difficulty.leicht,
                groupValue: _selectedDifficulty,
                onChanged: _updateDifficulty,
              ),
            ),
            ListTile(
              title: Text('🟡 Mittel'),
              leading: Radio<Difficulty>(
                value: Difficulty.mittel,
                groupValue: _selectedDifficulty,
                onChanged: _updateDifficulty,
              ),
            ),
            ListTile(
              title: Text('🔴 Schwer'),
              leading: Radio<Difficulty>(
                value: Difficulty.schwer,
                groupValue: _selectedDifficulty,
                onChanged: _updateDifficulty,
              ),
            ),
            Divider(height: 30),
            Text(
              '🌓 Theme wählen:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text(_isDarkMode ? '🌙 Dunkler Modus' : '☀️ Heller Modus'),
              value: _isDarkMode,
              onChanged: _toggleTheme,
            ),
            Divider(height: 30),
            Text(
              '🧹 Spielstände zurücksetzen:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton.icon(
              onPressed: _resetPreferences,
              icon: Icon(Icons.delete_forever),
              label: Text('Alle Spielstände löschen'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Aktuell: ${_selectedDifficulty.name} | ${_isDarkMode ? "Dark Mode" : "Light Mode"}',
              style: TextStyle(color: Colors.deepPurpleAccent),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
