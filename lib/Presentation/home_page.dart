import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_hurdle/Provider/StateProvider.dart';

import 'helper_functions.dart';
import 'hurdle_board.dart';
import 'keyboard_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Word Hurdle"),
        centerTitle: true,
      ),
      body: Column(
        // mainAxisSize: MainAxisSize.min,

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          HurdleBoard(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => context.read<StateProvider>().onSubmit(),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
                child: Text("Submit"),
              ),
              KeyboardView(
                onKeyPress: (String e) =>
                    context.read<StateProvider>().alphabetInputting(e),
                onDeleteKeyPress: () => context.read<StateProvider>().onDeletePress(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(onPressed: () {}, child: Text("reset")),
        ElevatedButton(onPressed: () {}, child: Text("Submit")),
      ],
    );
  }

  Widget showDialogMsg() {
    return Text('');
  }
}
