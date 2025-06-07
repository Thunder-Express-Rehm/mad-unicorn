// lib/pages/intro_page.dart
import 'package:flutter/material.dart';
import 'home_page.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  int _currentIndex = 0;

  final List<String> _introTexts = [
    'Thailand, 2013.\nEin junger Mann träumt davon, die Logistikbranche zu revolutionieren.',
    'Sein Name: Comsane Zaeleen.\nKeine Mittel. Keine Unterstützung. Kein Backup.',
    'Aber einen Plan.\nUnd den Mut, alles zu riskieren.',
    'Was als kleiner Campus-Lieferservice beginnt,\nführt zum ersten Logistik-Einhorn Südostasiens.',
    'Doch sein Aufstieg ist kein Zufall.\nEs ist eine Geschichte voller Verrat, Entscheidungen und KI.',
    'MAD UNICORN\nBasierend auf wahren Begebenheiten.'
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _startIntroSequence();
  }

  void _startIntroSequence() async {
    for (int i = 0; i < _introTexts.length; i++) {
      setState(() {
        _currentIndex = i;
      });
      await _controller.forward();
      await Future.delayed(Duration(seconds: 2));
      _controller.reset();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  _introTexts[_currentIndex],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Text(
              'MAD UNICORN © 2025',
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
