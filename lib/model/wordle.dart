import 'package:flutter/foundation.dart';

@immutable
class Wordle {
  String letter;

  bool isInTheTarget;



  bool isOnTheCorrectPosition;
  // bool iSNotOnTheCorrectPosition;

  bool isNotInTheTarget;


  Wordle copyWith({
    String? letter,
    bool? isInTheTarget,
    bool? isOnTheCorrectPosition,
    bool? isNotInTheTarget,
  }) {
    return Wordle(
      letter: letter ?? this.letter,
      isInTheTarget: isInTheTarget ?? this.isInTheTarget,
      isOnTheCorrectPosition: isOnTheCorrectPosition ?? this.isOnTheCorrectPosition,
      isNotInTheTarget: isNotInTheTarget ?? this.isNotInTheTarget,
    );
  }

  Wordle(
      {required this.letter,
      this.isInTheTarget = false,
      this.isNotInTheTarget = false,
      // this.iSNotOnTheCorrectPosition = false,
      this.isOnTheCorrectPosition = false});
}
