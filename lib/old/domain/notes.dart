// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' show Random;

import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:uuid/uuid.dart';

class Notes {
  String id;
  String text;
  int randomNumber;

  Notes({
    required this.id,
    this.text = '',
    this.randomNumber = -1,
  });

  factory Notes.fromString(String text) => Notes(
        id: Uuid().v4(),
        text: text,
        randomNumber: Random().nextInt(100000),
      );

  factory Notes.random() => Notes(
        id: Uuid().v4(),
        text: lorem(paragraphs: 2, words: 60),
        randomNumber: Random().nextInt(100000),
      );
}
