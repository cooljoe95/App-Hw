class Board {
  constructor() {
    this.board = new Array(new Array(3), new Array(3), new Array(3));
  }

  print() {
    console.log(`Current Board: `);
    let i = 0;
    console.log("   0 1 2");
    this.board.forEach( row => {
      let rowString = [];
      for(let j = 0; j < row.length; j++){
        if(row[j]){
          rowString.push(row[j]);
        } else {
          rowString.push("_");
        }
      }
      console.log(`${i++}: ${rowString}`);
    });
  }

  placeMark(mark, x_pos, y_pos) {
    if (this.validMove(x_pos, y_pos)) {
      this.board[x_pos][y_pos] = mark;
      return true;
    } else {
      return false;
    }
  }

  validMove(x_pos, y_pos) {
    if (x_pos > 2 || y_pos > 2 || x_pos < 0 || y_pos < 0) {
      console.log("Invalid move, try again!");
      return false;
    } else if (!this.board[x_pos][y_pos]) {
      return true;
    } else {
      console.log("Invalid move, try again!");
      return false;
    }
  }

  isTie(){
    let full = true;
    this.board.forEach( row => {
      row.forEach ( el => {
        if(!el){
          full = false;
        }
      });
    });
    return full;
  }

  isWon() {
    return (this.rows() || this.columns() || this.diagonals());
  }

  rows(){
    let sameEls = false;
    this.board.forEach( row => {
      if(row[0]){
        if(row[0] === row[1] && row[1] === row[2]){
          sameEls = true;
        }
      }
    });
    return sameEls;
  }

  transpose(){
    const transposed = new Array(new Array(3), new Array(3), new Array(3));
    for(let i = 0; i < this.board.length; i++){
      for(let j = 0; j < this.board.length; j++){
        transposed[j][i] = this.board[i][j];
      }
    }
    return transposed;
  }

  columns(){
    this.board = this.transpose();
    const val = this.rows();
    this.board = this.transpose();
    return val;
  }

  diagonals(){
    const center = this.board[1][1];
    if (center) {
      if (this.board[0][0] === center && this.board[2][2] === center) {
        return true;
      } else if (this.board[0][2] === center && this.board[2][0] === center) {
        return true;
      }
    }

    return false;
  }
}

module.exports = Board;

// const board = new Board();
// board.placeMark("x", 0, 0);
// board.placeMark("x", 1, 0);
// board.placeMark("x", 2, 0);
// board.print();
// console.log(board.isWon());
