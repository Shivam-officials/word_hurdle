
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

void showDialogWithMsg({required BuildContext context,required String title, required String body, required VoidCallback onQuit, required VoidCallback onPlayAgain}){
  showDialog(context: context, builder: (context) => AlertDialog(
    title: Text(title),
    content: Text(body),
    actions: [
      TextButton(
        onPressed: onQuit,
        child: const Text('QUIT'),
      ),
      TextButton(
        onPressed: onPlayAgain,
        child: const Text('PLAY AGAIN'),
      ),
    ],
  ));
}