
import 'package:flutter/material.dart';

import '../model/wordle.dart';

decideColor(Wordle hurdleBoardElement,Color defaultColor) {
  if (hurdleBoardElement.isInTheTarget) {
    return hurdleBoardElement.isOnTheCorrectPosition
        ? Colors.greenAccent.shade400
        : Colors.blueAccent;
  } else if (hurdleBoardElement.isNotInTheTarget) {
    return Colors.grey.shade500;
  }
  return defaultColor;
}