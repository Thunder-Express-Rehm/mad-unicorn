// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _lastRoute;

  @override
  void initState() {
    super.initState();
    _loadLastRoute();
  }

  Future<void> _loadLastRoute() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _lastRoute = prefs.getString('lastRoute');
    });
  }

  Future<void> _resetGame() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('lastRoute');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Spielstand wurde zurückgesetzt.')),
    );
    setState(() {
      _lastRoute = null;
    });
  }

  void _navigateTo(String route) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastRoute', route);
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MAD UNICORN'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_lastRoute != null)
              ElevatedButton.icon(
                icon: Icon(Icons.play_arrow),
                label: Text('Fortsetzen'),
                onPressed: () {
                  Navigator.pushNamed(context, _lastRoute!);
                },
              ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.fiber_new),
              label: Text('Neues Spiel starten'),
              onPressed: () {
                _navigateTo('/mission1');
              },
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.restart_alt),
              label: Text('Spiel zurücksetzen'),
              onPressed: _resetGame,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Einstellungen'),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
    );
  }
}
