const Board = require('./board');

class Game {
  constructor(reader, player1, player2) {
    this.board = new Board();
    this.players = [player1, player2];
    this.currentPlayer = player1;
    this.reader = reader;
  }

  changePlayer(){
    if(this.currentPlayer === this.players[0]){
      this.currentPlayer = this.players[1];
    } else {
      this.currentPlayer = this.players[0];
    }
  }

  run(callback) {
    this.callback = callback;
    if (this.board.isWon()) {
      this.changePlayer();
      console.log(`${this.currentPlayer.name} won!`);
      callback();
    } else if (this.board.isTie()) {
      console.log("It's a tie!");
      callback();
    } else {
      this.board.print();
      this.currentPlayer.getMove.call(this, this.board);
    }
  }

  makeMove(xPos, yPos) {
    const valid = this.board.placeMark(this.currentPlayer.mark, xPos, yPos);

    if (valid) {
      this.changePlayer();
      this.run(this.callback);
    } else {
      this.currentPlayer.getMove.call(this, this.board);
    }
  }
}

module.exports = Game;
