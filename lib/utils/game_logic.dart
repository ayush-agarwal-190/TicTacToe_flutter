// ignore_for_file: prefer_const_declarations, duplicate_ignore

class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
}

class Game {
  // ignore: prefer_const_declarations
  //3*3
  static final boardlenth = 9; 
  static final blocSize = 100.0;

  // empty board
  List<String>? board;

  static List<String>? initGameBoard() =>
      List.generate(boardlenth, (index) => Player.empty);

  //now we need to build the winner check algorithm
  //for this we need first to declare a scoreboard in our main file
  bool winnerCheck(
      String player, int index, List<int> scoreboard, int gridSize) {
    // declaring col and row
    int row = index ~/ 3;
    int col = index % 3;
    int score = player == "X" ? 1 : -1;

    scoreboard[row] += score;
    scoreboard[gridSize + col] += score;
    if (row == col) 
       scoreboard[2 * gridSize] += score;
    if (gridSize - 1 - col == row) 
        scoreboard[2 * gridSize + 1] += score;

 
    if (scoreboard.contains(3) || scoreboard.contains(-3)) {
      return true;
    }
    ;

    //by default it will return false
    return false;
  }
}
