class Game {
  constructor(reader, n = 3) {
    this.numDiscs = n;
    this.reader = reader;
    const firstTower = [];
    for (let i = n; i > 0; i--) {
      firstTower.push(i);
    }
    this.board = [firstTower, [], []];
  }

  run(completionCallback) {
    this.completionCallback = completionCallback;
    if (this.isWon()) {
      completionCallback();
    } else {
      this.promptMove(this.move.bind(this));
    }
  }

  promptMove(callback){
    this.print();
    this.reader.question(`What stack would you want to move from? `, function(answer){
      const from_stack = parseInt(answer);
      this.reader.question(`What stack would you want to move from? `, function(answer){
        const to_stack = parseInt(answer);
        callback(from_stack, to_stack);
      });
    }.bind(this));
  }

  isValidMove(from_stack, to_stack){
    if (this.board[from_stack].length > 0) {
      if (this.board[to_stack].length === 0) {
        return true;
      } else {
        if (this.board[from_stack].slice(-1) < this.board[to_stack].slice(-1)) {
          return true;
        }
      }
    }
    console.error('Not a valid move!');
    return false;
  }

  move (from_stack, to_stack) {
    if (this.isValidMove(from_stack, to_stack)) {
      this.board[to_stack].push(this.board[from_stack].pop());
    }
    this.run(this.completionCallback);
  }

  print () {
    console.log(`Current Board: `);
    let i = 0;
    this.board.forEach( row => { console.log(`Tower ${i++}: ${JSON.stringify(row)}`); });
  }

  isWon() {
    if (this.board[2].length === this.numDiscs) {
      return true;
    } else {
      return false;
    }
  }

}

// const game = new Game();
// game.run(function() { console.log("Winner winner!"); });

module.exports = Game;
