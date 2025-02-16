import 'dart:math';

import 'package:english_words/english_words.dart' as english_words;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:word_hurdle/model/wordle.dart';

import '../Presentation/helper_functions.dart';

class StateProvider extends ChangeNotifier {
  int _wordLength = 5;

  int get wordLength => _wordLength;
  final maxNoOfAttempts = 6;
  String targetWord = '';

  int get numberOfCellsInHurdleBoard => _wordLength * maxNoOfAttempts;

  List<Wordle> hurdleBoardElements = [];
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
  List<String> excludedWords = [];
  List<String> includedOnRightLocationWords = [];
  List<String> includedNotOnRightLocationWords = [];
  List<String> totalWords = [];

  /// This simple function initializes important variables when the `StateProvider` object is created,
  /// like `totalWords` and `targetWord`, ensuring they're set up before use.
  void init() {
    totalWords =
        english_words.all.where((word) => word.length == _wordLength).toList();
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

  // for managing the input from user
  List<String> rowInput = [];
  int index = 0;
  int count = 0;

  int get maxCountPerRow => _wordLength;
  int ongoingNumberOfAttempt = 1;
  bool isCorrectAns = false;

  void alphabetInputting(String element) {
    debugPrint('USER CLICKED THE $element');
    if (count < maxCountPerRow) {
      hurdleBoardElements[index] = Wordle(letter: element);
      rowInput.add(element);
      count++;
      index++;
      notifyListeners();
    }
  }

  void onSubmit() {
    List<String> targetWordList = targetWord.split('');
    debugPrint(targetWordList.toString());
    int itr = index;
    for (int i = 0; i < _wordLength; i++) {
      if (targetWordList[i] == rowInput[i]) {
        // hurdleBoardElements[itr-wordLength].isInTheTarget = true;
        hurdleBoardElements[itr - wordLength] =
            hurdleBoardElements[itr - wordLength].copyWith(isInTheTarget: true);

        // hurdleBoardElements[itr-wordLength].isOnTheCorrectPosition = true;
        hurdleBoardElements[itr - wordLength] =
            hurdleBoardElements[itr - wordLength]

                .copyWith(isOnTheCorrectPosition: true);
        includedOnRightLocationWords.contains(rowInput[i])? includedNotOnRightLocationWords.remove(rowInput[i]):null;
        includedOnRightLocationWords.add(rowInput[i]);
      } else if (targetWordList.contains(rowInput[i])) {
        // hurdleBoardElements[itr-wordLength].isInTheTarget = true;
        hurdleBoardElements[itr - wordLength] =
            hurdleBoardElements[itr - wordLength].copyWith(isInTheTarget: true);
        includedNotOnRightLocationWords.add(rowInput[i]);
      } else {
        // hurdleBoardElements[itr-wordLength].isNotInTheTarget = true;
        hurdleBoardElements[itr - wordLength] =
            hurdleBoardElements[itr - wordLength]
                .copyWith(isNotInTheTarget: true);

        excludedWords.add(rowInput[i]);
      }
      itr++;
    }

    if (targetWord == rowInput.join('')) {
      isCorrectAns = true;
    }

    moveToNextRow();
    notifyListeners();
  }

  void moveToNextRow() {
    if (ongoingNumberOfAttempt <= maxNoOfAttempts) {
      count = 0;
      rowInput.clear();
      ongoingNumberOfAttempt++;
    }
  }

  void onDeletePress(){
    if (count >0) {
      index--;
      hurdleBoardElements[index] = Wordle(letter: '');
      rowInput.removeAt(count-1);
      count--;
      notifyListeners();
    }
  }

  void resetGameStates(){
    index = 0;
    excludedWords.clear();
    includedNotOnRightLocationWords.clear();
    includedOnRightLocationWords.clear();
    init();
    isCorrectAns = false;
    ongoingNumberOfAttempt = 1;
    rowInput.clear();
    count = 0;
    notifyListeners();
  }

}
