import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_hurdle/Provider/StateProvider.dart';
import 'package:word_hurdle/model/wordle.dart';

import 'helper_functions.dart';

class HurdleBoard extends StatelessWidget {
  const HurdleBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.read<StateProvider>().wordLength),
        itemCount: context.read<StateProvider>().numberOfCellsInHurdleBoard,
        itemBuilder: (context, index) => wordleCell(context, index));
  }

  Widget wordleCell(BuildContext context, int currentHurdleBoardElementIndex) {
    return Selector(
      selector: (BuildContext context, StateProvider stateProvider) =>
          stateProvider.hurdleBoardElement[currentHurdleBoardElementIndex],
      builder: (BuildContext context, currentWord, child) => Container(
        decoration: BoxDecoration(
            color: decideColor(currentWord),
            shape: BoxShape.rectangle,
            border: Border.all(
              width: 2.5,
            )),
        child: Center(
          child: Text(
            currentWord.letter,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }


}
