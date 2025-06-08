// lib/pages/cutscene_page.dart
import 'package:flutter/material.dart';

class CutscenePage extends StatefulWidget {
  @override
  _CutscenePageState createState() => _CutscenePageState();
}

class _CutscenePageState extends State<CutscenePage> with SingleTickerProviderStateMixin {
  final List<String> _frames = [
    'assets/comic/frame1.png',
    'assets/comic/frame2.png',
    'assets/comic/frame3.png',
    'assets/comic/frame4.png',
    'assets/comic/frame5.png',
    'assets/comic/frame6.png',
  ];

  int _currentIndex = 0;

  void _nextFrame() {
    if (_currentIndex < _frames.length - 1) {
      setState(() => _currentIndex++);
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: _nextFrame,
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: Image.asset(
                _frames[_currentIndex],
                key: ValueKey<int>(_currentIndex),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              bottom: 30,
              right: 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: _nextFrame,
                child: Text(
                  _currentIndex < _frames.length - 1 ? "Weiter" : "Zum Spiel",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
