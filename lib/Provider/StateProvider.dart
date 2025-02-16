
import 'package:flutter/foundation.dart';
import 'package:word_hurdle/model/wordle.dart';

class StateProvider extends ChangeNotifier {

  int _wordLength = 5;
  int get wordLength  => _wordLength ;
  List<List<String>> keys = [
    ['Q','W','E','R', 'T', 'Y', 'U', 'I', 'O', 'P',],
    ['A','S', 'D', 'F', 'G', 'H', 'I', 'J', 'k', 'L'],
    ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
  ];
  final noOfAttempts = 6;


  int get numberOfCellsInHurdleBoard => _wordLength * noOfAttempts;

  //*REMEMBER HERE
  List<Wordle> get hurdleBoardElement =>  List.generate( numberOfCellsInHurdleBoard, (e)=>Wordle(letter: ''));

  List<String> excludedWords = [];
  List<String> includedOnRightLocationWords = [];
  List<String> includedNotOnRightLocationWords = [];
}