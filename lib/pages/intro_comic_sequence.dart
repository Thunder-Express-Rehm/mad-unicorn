// lib/pages/intro_comic_sequence.dart
import 'package:flutter/material.dart';
import 'missions_overview_page.dart';

class IntroComicSequence extends StatefulWidget {
  @override
  State<IntroComicSequence> createState() => _IntroComicSequenceState();
}

class _IntroComicSequenceState extends State<IntroComicSequence> with TickerProviderStateMixin {
  late final PageController _controller;
  int _currentIndex = 0;

  final List<String> _frames = [
    'assets/comic/frame1.png',
    'assets/comic/frame2.png',
    'assets/comic/frame3.png',
    'assets/comic/frame4.png'
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  void _onNext() {
    if (_currentIndex < _frames.length - 1) {
      _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      setState(() => _currentIndex++);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MissionsOverviewPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: _onNext,
        child: PageView.builder(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _frames.length,
          itemBuilder: (context, index) {
            return Center(
              child: Image.asset(_frames[index], fit: BoxFit.contain),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
