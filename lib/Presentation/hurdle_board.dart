import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_hurdle/Provider/StateProvider.dart';

import 'helper_functions.dart';

class HurdleBoard extends StatefulWidget {
  const HurdleBoard({super.key});

  @override
  State<HurdleBoard> createState() => _HurdleBoardState();
}

class _HurdleBoardState extends State<HurdleBoard> {

  /// ✅ Ensures that critical variables in `[StateProvider]` are initialized **before** they are accessed in `build()`.
  /// ✅ Calls `init()` in `StateProvider`, which sets up game data (like `[hurdleBoardElements]` and `targetWord`).
  /// ✅ Prevents **RangeError** by ensuring lists are populated before the UI tries to use them.
  /// ✅ `didChangeDependencies()` is useful here because it runs **after** `initState()` and ensures the provider is available.
  /// ✅ `_isInitialized` in `StateProvider` prevents multiple re-initializations, avoiding unwanted resets on widget rebuilds.
  @override
  void didChangeDependencies() {
    context.read<StateProvider>().init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.read<StateProvider>().wordLength),
            itemCount: context.read<StateProvider>().numberOfCellsInHurdleBoard,
            itemBuilder: (context, index) => wordleCell(context, index)),
      ),
    ]);
  }

  Widget wordleCell(BuildContext context, int currentHurdleBoardElementIndex) {
    return Selector(
      selector: (BuildContext context, StateProvider stateProvider) =>
          stateProvider.hurdleBoardElements[currentHurdleBoardElementIndex],
      builder: (BuildContext context, currentWord, child) => Container(
        decoration: BoxDecoration(
          color: decideColor(currentWord, Colors.white),
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2.5
          )
        ),
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
