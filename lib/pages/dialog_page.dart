import 'package:flutter/material.dart';
import '../utils/globals.dart';
import '../utils/storage.dart'; // ✅ für saveMissionUnlocks()
import 'storylog_page.dart';

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  int _step = 0;
  List<String> _log = [];
  bool aborted = false;

  final List<Map<String, dynamic>> _dialogSteps = [
    {
      'text': '👤 Kunde: Lieferung X-92 ist überfällig. Status?',
      'options': [
        {
          'text': 'Bin unterwegs.',
          'response': '🧠 KI: Deine Route ist nicht optimal.',
          'next': 1
        },
        {
          'text': 'Ich brauche mehr Zeit.',
          'response': '🧠 KI: Zeit ist dein Feind.',
          'next': 1
        },
      ],
    },
    {
      'text': '👤 Kunde: Der Scanner zeigt eine Bewegung – wirst du verfolgt?',
      'options': [
        {
          'text': 'Nein, bin unentdeckt.',
          'response': '🧠 KI: Gut. Verhalte dich wie geplant.',
          'next': 2
        },
        {
          'text': 'Da ist jemand hinter mir.',
          'response': '🧠 KI: Mission kompromittiert.',
          'abort': true
        },
      ],
    },
    {
      'text': '👤 Kunde: Du musst einen alternativen Übergabepunkt wählen.',
      'options': [
        {
          'text': 'Nordbrücke – wie Backup C.',
          'response': '🧠 KI: Risiko hoch, aber akzeptabel.',
          'next': 3
        },
        {
          'text': 'Ich bleibe bei Punkt Alpha.',
          'response': '🧠 KI: Du wagst viel. Ich hoffe, es lohnt sich.',
          'next': 3
        },
      ],
    },
    {
      'text': '👤 Kunde: Letzte Frage – weißt du, was du transportierst?',
      'options': [
        {
          'text': 'Nein – i
