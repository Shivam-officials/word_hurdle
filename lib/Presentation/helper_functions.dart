
import 'package:flutter/material.dart';

import '../model/wordle.dart';

decideColor(Wordle hurdleBoardElement) {
  if (hurdleBoardElement.isInTheTarget) {
    return hurdleBoardElement.isOnTheCorrectPosition
        ? Colors.greenAccent.shade400
        : Colors.yellow;
  } else if (hurdleBoardElement.isNotInTheTarget) {
    return Colors.grey.shade500;
  }
  return Colors.white;
}