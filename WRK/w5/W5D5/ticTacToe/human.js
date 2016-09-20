class HumanPlayer{
  constructor(name, mark, reader){
    this.name = name;
    this.reader = reader;
    this.mark = mark;
  }

  getMove(board) {
    this.reader.question(`${this.currentPlayer.name}'s move, Enter x_position: `, function(answer){
      const xPos = parseInt(answer);
      this.reader.question(`Enter y_position: `, function(answer){
        const yPos = parseInt(answer);
        this.makeMove(yPos, xPos);
      }.bind(this));
    }.bind(this));
  }
}

module.exports = HumanPlayer;
