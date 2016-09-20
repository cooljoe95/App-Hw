class ComputerPlayer{
  constructor(name, mark, board){
    this.name = name;
    this.mark = mark;
    this.board = board;
  }

  getMove(board){
    const moves = [];
    for(let i = 0; i < 3; i++){
      for(let j = 0; j < 3; j++){
        if(!board[i][j]){
          moves.push([i, j]);
        }
      }
    }
    this.makeMove(...moves[Math.floor(Math.random * moves.length)]);
  }
}

module.exports = ComputerPlayer;
