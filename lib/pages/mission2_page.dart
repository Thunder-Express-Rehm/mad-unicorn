// lib/pages/mission2_page.dart
import 'package:flutter/material.dart';
import 'package:mad_unicorn/pages/decision_page.dart';

class Mission2Page extends StatefulWidget {
  @override
  _Mission2PageState createState() => _Mission2PageState();
}

class _Mission2PageState extends State<Mission2Page>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  int _currentPanel = 0;

  final List<String> _panels = [
    'Bangkok, Nacht.
Comsane trifft sich mit einem geheimen Investor in einem verlassenen Hochhaus.',
    'Der Mann überreicht eine Aktentasche.
"Darin befindet sich alles, was du brauchst. Aber es hat seinen Preis."',
    'Im Hintergrund: ein Schatten – ein Lauscher?
Comsane bleibt ruhig, aber seine Gedanken rasen.',
    'Er steht nun vor der Entscheidung:
Vertraut er dem Fremden – oder bricht er das Treffen ab?',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _startPanelSequence();
  }

  Future<void> _startPanelSequence() async {
    for (int i = 0; i < _panels.length; i++) {
      setState(() {
        _currentPanel = i;
      });
      await _controller.forward();
      await Future.delayed(Duration(seconds: 3));
      _controller.reset();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DecisionPage(missionId: 2)),
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
                  _panels[_currentPanel],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Text(
              'MISSION 02 – VERTRAUEN ODER FLUCHT',
              style: TextStyle(color: Colors.white38, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
