class Wordle {
  String letter;

  bool isInTheTarget;

  bool isOnTheCorrectPosition;
  // bool iSNotOnTheCorrectPosition;

  bool isNotInTheTarget;

  Wordle(
      {required this.letter,
      this.isInTheTarget = false,
      this.isNotInTheTarget = false,
      // this.iSNotOnTheCorrectPosition = false,
      this.isOnTheCorrectPosition = false});
}
