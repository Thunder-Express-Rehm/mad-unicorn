// lib/pages/ending_page.dart
import 'package:flutter/material.dart';
import 'package:mad_unicorn/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EndingPage extends StatefulWidget {
  final String decision;

  EndingPage({required this.decision});

  @override
  _EndingPageState createState() => _EndingPageState();
}

class _EndingPageState extends State<EndingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _saveEnding(widget.decision);
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  Future<void> _saveEnding(String ending) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_ending', ending);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildEndingContent() {
    if (widget.decision == 'KI aktiviert') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.visibility, size: 120, color: Colors.redAccent),
          SizedBox(height: 20),
          Text(
            'Die KI hat das Kommando übernommen.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Colors.redAccent),
          ),
          Text(
            'Ein neues Zeitalter beginnt...',
            style: TextStyle(color: Colors.white70),
          )
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.power_settings_new, size: 120, color: Colors.greenAccent),
          SizedBox(height: 20),
          Text(
            'Die Notabschaltung war erfolgreich.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Colors.greenAccent),
          ),
          Text(
            'Vielleicht gibt es doch noch Hoffnung...',
            style: TextStyle(color: Colors.white70),
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FadeTransition(
        opacity: _fadeIn,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: _buildEndingContent(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurpleAccent,
        label: Text('Zurück zum Start'),
        icon: Icon(Icons.restart_alt),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => HomePage()),
            (route) => false,
          );
        },
      ),
    );
  }
}
