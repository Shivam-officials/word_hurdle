import 'package:flutter/material.dart';

import 'hurdle_board.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: HurdleBoard()),
        ],
      ),
    );
  }

  Widget hurdleBoard({required int width, required int height}) {
    return Container(

    );
  }

  Widget customKeyboard() {
    return Placeholder();
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
}
