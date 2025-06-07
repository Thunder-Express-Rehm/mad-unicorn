import 'package:flutter/material.dart';

class StorylogPage extends StatelessWidget {
  final List<String> log;

  const StorylogPage({Key? key, required this.log}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('📜 Storylog')),
      body: ListView.builder(
        itemCount: log.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.bolt, color: Colors.yellow),
            title: Text(log[index]),
          );
        },
      ),
    );
  }
}
