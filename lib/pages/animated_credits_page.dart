// lib/pages/animated_credits_page.dart
import 'package:flutter/material.dart';
import 'package:mad_unicorn/pages/home_page.dart';

class AnimatedCreditsPage extends StatefulWidget {
  final List<String> decisions;

  const AnimatedCreditsPage({super.key, required this.decisions});

  @override
  State<AnimatedCreditsPage> createState() => _AnimatedCreditsPageState();
}

class _AnimatedCreditsPageState extends State<AnimatedCreditsPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  int _currentIndex = 0;

  final List<String> _creditTexts = [
    'Ein Spiel von Mad Unicorn Studios',
    'Basierend auf der wahren Geschichte von Komsan Saelee',
    'Story & Idee: Sascha Rehm',
    'Programmierung & Design: KI Co-Pilot & Team',
    'Musik: (lizenzfreie KI-Komposition)',
    'Besonderer Dank an alle Testspieler',
    'Und natürlich an Dich!' // letzter Frame
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _startCreditsSequence();
  }

  void _startCreditsSequence() async {
    for (int i = 0; i < _creditTexts.length; i++) {
      setState(() {
        _currentIndex = i;
      });
      await _controller.forward();
      await Future.delayed(const Duration(seconds: 2));
      _controller.reset();
    }
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
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _creditTexts[_currentIndex],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                if (_currentIndex == _creditTexts.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HomePage(),
                        ),
                      );
                    },
                    child: const Text('Zum Hauptmenü'),
                  ),
                if (_currentIndex == _creditTexts.length - 1)
                  const SizedBox(height: 20),
                if (_currentIndex == _creditTexts.length - 1)
                  const Text(
                    'Deine Entscheidungen:',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                if (_currentIndex == _creditTexts.length - 1)
                  ...widget.decisions.map((e) => Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          '- $e',
                          style: const TextStyle(color: Colors.white60),
                        ),
                      ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
