import 'package:flutter/material.dart';

class CutscenePage extends StatefulWidget {
  @override
  _CutscenePageState createState() => _CutscenePageState();
}

class _CutscenePageState extends State<CutscenePage> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  final List<String> imagePaths = [
    'assets/comic/page1.png',
    'assets/comic/page2.png',
    'assets/comic/page3.png',
    'assets/comic/page4.png',
    'assets/comic/page5.png',
    'assets/comic/page6.png',
    'assets/comic/page7.png',
    'assets/comic/page8.png',
    'assets/comic/page9.png',
    'assets/comic/page10.png',
  ];

  final List<String> texts = [
    'Irgendwo zwischen Lieferchaos, Stau und kaltem Kaffee... beginnt unsere Geschichte.',
    'Ein Kurierzentrum wie jedes andere – bis auf den kleinen Unterschied: Es ist der Anfang einer Revolution.',
    'Sein Name: Codename MAD UNICORN. Schnell. Genial. Unberechenbar.',
    'Er begann als einfacher Bote... aber er hatte Pläne. Große Pläne.',
    'Während andere Stau meldeten, flog er über alle hinweg – buchstäblich.',
    'Daten? Algorithmen? KI? Alles unter Kontrolle. Seine Strategie: grenzenloser Wahnsinn – mit System.',
    'Vom ersten Auftrag zum ersten Investment war es nur ein galoppierender Sprung.',
    'Die Firma wuchs. Mit ihr wuchs der Mythos.',
    'Heute liefert er global. Doch der Wahnsinn bleibt lokal.',
    'MAD UNICORN – Vom Kurier zum Logistik-Milliardär. Und das war erst der Anfang...',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  void _nextFrame() {
    if (_currentIndex < imagePaths.length - 1) {
      _controller.reverse().then((_) {
        setState(() {
          _currentIndex++;
        });
        _controller.forward();
      });
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildComicFrame() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Image.asset(
                imagePaths[_currentIndex],
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Text(
            texts[_currentIndex],
            style: TextStyle(
              fontFamily: 'ComicStyle',
              fontSize: 20,
              color: Colors.white,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: _nextFrame,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Text(
            _currentIndex < imagePaths.length - 1 ? 'Weiter' : 'Spiel starten',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: _buildComicFrame(),
        ),
      ),
    );
  }
}
