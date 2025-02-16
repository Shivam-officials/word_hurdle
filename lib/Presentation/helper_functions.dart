
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

Widget showDialogWithMsg({required BuildContext context,required String title, required String body, required VoidCallback onQuit, required VoidCallback onPlayAgain}){
  return AlertDialog(
    title: Text(title),
    content: Text(body),
    actions: [
      TextButton(onPressed: onQuit, child: Text("Quit")),
      TextButton(onPressed: onPlayAgain, child: Text("Play Again"))
    ],
  );
}