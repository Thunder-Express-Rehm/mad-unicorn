// lib/pages/comic_animation_page.dart
import 'package:flutter/material.dart';
import 'missions_overview_page.dart';

class ComicAnimationPage extends StatefulWidget {
  const ComicAnimationPage({super.key});

  @override
  State<ComicAnimationPage> createState() => _ComicAnimationPageState();
}

class _ComicAnimationPageState extends State<ComicAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _currentFrame = 0;
  final List<String> _frames = List.generate(6, (i) => 'assets/comic/frame${i + 1}.png');

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (_currentFrame < _frames.length - 1) {
            setState(() => _currentFrame++);
            _controller.forward(from: 0);
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => MissionsOverviewPage()),
            );
          }
        }
      });

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
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
          opacity: _animation,
          child: Image.asset(_frames[_currentFrame], fit: BoxFit.contain),
        ),
      ),
    );
  }
}
