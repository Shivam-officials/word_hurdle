import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_hurdle/Provider/StateProvider.dart';

class KeyboardView extends StatelessWidget {
  Function(String) onKeyPress;
  VoidCallback onDeleteKeyPress;

  KeyboardView({super.key, required this.onKeyPress,required this.onDeleteKeyPress});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: context
                  .read<StateProvider>()
                  .keys[0]
                  .map((
                    e,
                  ) =>
                      keyButton(context, e, onKeyPress))
                  .toList(),
            ),
            Row(
              children: context
                  .read<StateProvider>()
                  .keys[1]
                  .map((e) => keyButton(context, e, onKeyPress))
                  .toList(),
            ),
            Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Row(
                    children: context
                        .read<StateProvider>()
                        .keys[2]
                        .map((e) => keyButton(context, e, onKeyPress))
                        .toList(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                      onPressed: onDeleteKeyPress,
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: Text(
                        " X ",
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget keyButton(BuildContext context, String e, Function onKeyPress) {
    return Expanded(
      child: ElevatedButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: keyBackGroundColor(context, e),
        ),
        child: Text(
          e,
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        onPressed: () => onKeyPress(e),
      ),
    );
  }

  Color keyBackGroundColor(BuildContext context, String e) {
    var stateProvider = context.read<StateProvider>();
    if (stateProvider.excludedWords.contains(e)) {
      return Colors.grey.shade700;
    } else if (stateProvider.includedOnRightLocationWords.contains(e)) {
      return Colors.green.shade900;
    } else if (stateProvider.includedNotOnRightLocationWords.contains(e)) {
      return Colors.blueAccent;
    }

    return Colors.transparent;
  }
}
