import 'dart:math';

class Player {
  static List<int> playerX = [];
  static List<int> playerO = [];
}

extension ContainsAll on List {
  bool containsAll(int x, int y, [z]) {
    if (z == null)
      return contains(x) && contains(y);
    else
      return contains(x) && contains(y) && contains(z);
  }
}

class Game {
  void playGame(int index, String activePlayer) {
    if (activePlayer == 'X')
      Player.playerX.add(index);
    else
      Player.playerO.add(index);
  }

  String checkWinner() {
    String winner = '';

    if (Player.playerX.containsAll(0, 1, 2) ||
        Player.playerX.containsAll(3, 4, 5) ||
        Player.playerX.containsAll(6, 7, 8) ||
        Player.playerX.containsAll(0, 3, 6) ||
        Player.playerX.containsAll(1, 4, 7) ||
        Player.playerX.containsAll(2, 5, 8) ||
        Player.playerX.containsAll(0, 4, 8) ||
        Player.playerX.containsAll(2, 4, 6))
      winner = 'X';
    else if (Player.playerO.containsAll(0, 1, 2) ||
        Player.playerO.containsAll(3, 4, 5) ||
        Player.playerO.containsAll(6, 7, 8) ||
        Player.playerO.containsAll(0, 3, 6) ||
        Player.playerO.containsAll(1, 4, 7) ||
        Player.playerO.containsAll(2, 5, 8) ||
        Player.playerO.containsAll(0, 4, 8) ||
        Player.playerO.containsAll(2, 4, 6))
      winner = 'O';
    else
      winner = '';

    return winner;
  }

  Future<void> autoPlay(activePlayer) async {
    int index = 0;
    List<int> emptyCells = [];

    for (var i = 0; i < 9; i++) {
      if (!(Player.playerX.contains(i) || Player.playerO.contains(i)))
        emptyCells.add(i);
    }

// start - center
    if (Player.playerO.containsAll(0, 1) && emptyCells.contains(2))
      index = 2;
    else if (Player.playerO.containsAll(3, 4) && emptyCells.contains(5))
      index = 5;
    else if (Player.playerO.containsAll(6, 7) && emptyCells.contains(8))
      index = 8;
    else if (Player.playerO.containsAll(0, 3) && emptyCells.contains(6))
      index = 6;
    else if (Player.playerO.containsAll(1, 4) && emptyCells.contains(7))
      index = 7;
    else if (Player.playerO.containsAll(2, 5) && emptyCells.contains(8))
      index = 8;
    else if (Player.playerO.containsAll(0, 4) && emptyCells.contains(8))
      index = 8;
    else if (Player.playerO.containsAll(2, 4) && emptyCells.contains(6))
      index = 6;

    // start - end
    else if (Player.playerO.containsAll(0, 2) && emptyCells.contains(1))
      index = 1;
    else if (Player.playerO.containsAll(3, 5) && emptyCells.contains(4))
      index = 4;
    else if (Player.playerO.containsAll(6, 8) && emptyCells.contains(7))
      index = 7;
    else if (Player.playerO.containsAll(0, 6) && emptyCells.contains(3))
      index = 3;
    else if (Player.playerO.containsAll(1, 7) && emptyCells.contains(4))
      index = 4;
    else if (Player.playerO.containsAll(2, 8) && emptyCells.contains(5))
      index = 5;
    else if (Player.playerO.containsAll(0, 8) && emptyCells.contains(4))
      index = 4;
    else if (Player.playerO.containsAll(2, 6) && emptyCells.contains(4))
      index = 4;

// center - end
    else if (Player.playerO.containsAll(1, 2) && emptyCells.contains(0))
      index = 0;
    else if (Player.playerO.containsAll(4, 5) && emptyCells.contains(3))
      index = 3;
    else if (Player.playerO.containsAll(7, 8) && emptyCells.contains(6))
      index = 6;
    else if (Player.playerO.containsAll(3, 6) && emptyCells.contains(0))
      index = 0;
    else if (Player.playerO.containsAll(4, 7) && emptyCells.contains(1))
      index = 1;
    else if (Player.playerO.containsAll(5, 8) && emptyCells.contains(2))
      index = 2;
    else if (Player.playerO.containsAll(4, 8) && emptyCells.contains(0))
      index = 0;
    else if (Player.playerO.containsAll(4, 6) && emptyCells.contains(2))
      index = 2;

// start - center
    else if (Player.playerX.containsAll(0, 1) && emptyCells.contains(2))
      index = 2;
    else if (Player.playerX.containsAll(3, 4) && emptyCells.contains(5))
      index = 5;
    else if (Player.playerX.containsAll(6, 7) && emptyCells.contains(8))
      index = 8;
    else if (Player.playerX.containsAll(0, 3) && emptyCells.contains(6))
      index = 6;
    else if (Player.playerX.containsAll(1, 4) && emptyCells.contains(7))
      index = 7;
    else if (Player.playerX.containsAll(2, 5) && emptyCells.contains(8))
      index = 8;
    else if (Player.playerX.containsAll(0, 4) && emptyCells.contains(8))
      index = 8;
    else if (Player.playerX.containsAll(2, 4) && emptyCells.contains(6))
      index = 6;

// start - end
    else if (Player.playerX.containsAll(0, 2) && emptyCells.contains(1))
      index = 1;
    else if (Player.playerX.containsAll(3, 5) && emptyCells.contains(4))
      index = 4;
    else if (Player.playerX.containsAll(6, 8) && emptyCells.contains(7))
      index = 7;
    else if (Player.playerX.containsAll(0, 6) && emptyCells.contains(3))
      index = 3;
    else if (Player.playerX.containsAll(1, 7) && emptyCells.contains(4))
      index = 4;
    else if (Player.playerX.containsAll(2, 8) && emptyCells.contains(5))
      index = 5;
    else if (Player.playerX.containsAll(0, 8) && emptyCells.contains(4))
      index = 4;
    else if (Player.playerX.containsAll(2, 6) && emptyCells.contains(4))
      index = 4;

// center - end
    else if (Player.playerX.containsAll(1, 2) && emptyCells.contains(0))
      index = 0;
    else if (Player.playerX.containsAll(4, 5) && emptyCells.contains(3))
      index = 3;
    else if (Player.playerX.containsAll(7, 8) && emptyCells.contains(6))
      index = 6;
    else if (Player.playerX.containsAll(3, 6) && emptyCells.contains(0))
      index = 0;
    else if (Player.playerX.containsAll(4, 7) && emptyCells.contains(1))
      index = 1;
    else if (Player.playerX.containsAll(5, 8) && emptyCells.contains(2))
      index = 2;
    else if (Player.playerX.containsAll(4, 8) && emptyCells.contains(0))
      index = 0;
    else if (Player.playerX.containsAll(4, 6) && emptyCells.contains(2))
      index = 2;
    else {
      Random random = Random();
      index = random.nextInt(emptyCells.length); 
    }

    playGame(index, activePlayer);
  }
}