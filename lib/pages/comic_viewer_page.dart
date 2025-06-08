// lib/pages/comic_viewer_page.dart
import 'package:flutter/material.dart';

class ComicViewerPage extends StatefulWidget {
  @override
  _ComicViewerPageState createState() => _ComicViewerPageState();
}

class _ComicViewerPageState extends State<ComicViewerPage> {
  final List<String> comicPages = List.generate(
    10,
    (index) => 'assets/comic/page${index + 1}.png',
  );

  int currentPage = 0;

  void _nextPage() {
    if (currentPage < comicPages.length - 1) {
      setState(() => currentPage++);
    }
  }

  void _previousPage() {
    if (currentPage > 0) {
      setState(() => currentPage--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('MAD UNICORN: Comic')),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(comicPages[currentPage]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentPage > 0)
                  ElevatedButton(
                    onPressed: _previousPage,
                    child: Text('◀ Zurück'),
                  ),
                Text(
                  'Seite ${currentPage + 1} / ${comicPages.length}',
                  style: TextStyle(color: Colors.white70),
                ),
                if (currentPage < comicPages.length - 1)
                  ElevatedButton(
                    onPressed: _nextPage,
                    child: Text('Weiter ▶'),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
