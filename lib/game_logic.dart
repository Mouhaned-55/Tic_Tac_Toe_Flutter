import 'dart:math';

class Player {
  static const x = 'X';
  static const O = 'X';
  static const empty = '';

  static List<int> playerX = [];
  static List<int> playero = [];
}

class Game {
  void playGame(int index, String activePlayer) {
    if (activePlayer == "X")
      Player.playerX.add(index);
    else
      Player.playero.add(index);
  }

  chickenWinner() {}

  Future<void> autoPlay(activePlayer) async {
    int index = 0;
    List<int> emptyCells = [];
    
    for (var i = 0; i < 9; i++) {
      if (!(Player.playero.contains(i) && Player.playerX.contains(i))) {
        emptyCells.add(i);
      }
      Random random = Random();
      int randomIndex = random.nextInt(emptyCells.length);

      index = emptyCells[randomIndex];
      playGame(index, activePlayer);
    }
  }
}
