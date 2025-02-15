
import 'package:flutter/foundation.dart';
import 'package:word_hurdle/model/wordle.dart';

class StateProvider extends ChangeNotifier {

  int _wordLength = 5;
  int get wordLength  => _wordLength ;

  final noOfAttempts = 6;

  int get numberOfCellsInHurdleBoard => _wordLength * noOfAttempts;

  //*REMEMBER HERE
  List<Wordle> get hurdleBoardElement =>  List.generate( numberOfCellsInHurdleBoard, (e)=>Wordle(letter: ''));


}