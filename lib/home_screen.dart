import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tic_tac_toe_flutter/game_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activePlayer = 'X';
  bool gameOver = false;
  int turn = 0;
  String result = 'xxxxxxxxxxxx';
  Game game = Game();
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: Column(
        children: [
          SwitchListTile.adaptive(
              title: const Text(
                "Turn on/off two players",
                style: TextStyle(color: Colors.white, fontSize: 28),
                textAlign: TextAlign.center,
              ),
              value: isSwitched,
              onChanged: (bool newValue) {
                setState(() {
                  isSwitched = newValue;
                });
              }),
          Text(
            "It's $activePlayer's turn".toUpperCase(),
            style: const TextStyle(color: Colors.white, fontSize: 52),
            textAlign: TextAlign.center,
          ),
          Expanded(
              child: GridView.count(
            padding: EdgeInsets.all(16),
            mainAxisSpacing: 6.0,
            crossAxisSpacing: 6.0,
            childAspectRatio: 1.0,
            crossAxisCount: 3,
            children: List.generate(
                9,
                (index) => InkWell(
                      onTap: gameOver ? null : () => _onTap(index),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).shadowColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                            child: Text(
                                Player.playerX.contains(index)
                                    ? "X"
                                    : Player.playerO.contains(index)
                                        ? "O"
                                        : "",
                                style: TextStyle(
                                    fontSize: 52,
                                    color: Player.playerX.contains(index)
                                        ? Colors.blue
                                        : Colors.pink))),
                      ),
                    )),
          )),
          Text(
            result,
            style: const TextStyle(color: Colors.white, fontSize: 42),
            textAlign: TextAlign.center,
          ),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                Player.playerX = [];
                Player.playerO = [];
                activePlayer = "X";
                gameOver = false;
                turn = 0;
                result = "";
              });
            },
            icon: const Icon(Icons.replay),
            label: const Text("Repeat the game"),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).splashColor)),
          )
        ],
      )),
    );
  }

  _onTap(int index) async {
    if ((Player.playerX.isEmpty || !Player.playerX.contains(index)) &&
        (Player.playerO.isEmpty || !Player.playerO.contains(index))) {
      game.playGame(index, activePlayer);
      updateState();

      if (!isSwitched && !gameOver && turn != 9) {
        await game.autoPlay(activePlayer);
        updateState();
      }
    }
  }

  void updateState() {
    setState(() {
      activePlayer = (activePlayer == 'X') ? 'O' : 'X';
      turn++;
      String winnerPlayer = game.checkWinner();
      if (winnerPlayer != "") {
        gameOver = true;
        result = '$winnerPlayer is the winner';
      } else if (!gameOver && turn == 9) {
        result = "it's a Draw";
      }
    });
  }
}
