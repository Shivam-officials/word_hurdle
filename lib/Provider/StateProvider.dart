import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:word_hurdle/model/wordle.dart';
import 'package:english_words/english_words.dart' as english_words;

class StateProvider extends ChangeNotifier {

  int _wordLength = 5;

  int get wordLength => _wordLength;
  List<List<String>> keys = [
    [
      'Q',
      'W',
      'E',
      'R',
      'T',
      'Y',
      'U',
      'I',
      'O',
      'P',
    ],
    ['A', 'S', 'D', 'F', 'G', 'H', 'I', 'J', 'k', 'L'],
    ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
  ];
  final noOfAttempts = 6;
  String targetWord = '';

  List<Wordle> hurdleBoardElements = [];

  int get numberOfCellsInHurdleBoard => _wordLength * noOfAttempts;

  List<String> excludedWords = [];
  List<String> includedOnRightLocationWords = [];
  List<String> includedNotOnRightLocationWords = [];
  List<String> totalWords = [];


  /// This simple function initializes important variables when the `StateProvider` object is created,
  /// like `totalWords` and `targetWord`, ensuring they're set up before use.
  void init() {
    totalWords = english_words.all.where((word)=>word.length == _wordLength).toList();
    print(totalWords);
    generateBoard();
    generateRandomWord();
    // notifyListeners();
  }

  //*REMEMBER HERE
  generateBoard() {
    hurdleBoardElements =
        List.generate(numberOfCellsInHurdleBoard, (e) => Wordle(letter: ''));
  }

  generateRandomWord() {

    targetWord =
        totalWords[Random.secure().nextInt(totalWords.length)].toUpperCase();
    debugPrint(" the TARGET WORD is $targetWord");
  }
}
