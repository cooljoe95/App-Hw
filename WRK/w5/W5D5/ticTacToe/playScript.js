const Game = require('./game');
const ComputerPlayer = require('./ai');
const HumanPlayer = require('./human');

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const gameCallback = function() {
  reader.question('Do you want to play again? ', function(answer) {
    if (answer.toUpperCase() === "YES") {
      console.log('Have fun!');
      gameStarter();
    } else {
      console.log('Goodbye!');
      reader.close();
    }
  });
};

const human = new HumanPlayer("Roger", "X", reader);
const ai = new HumanPlayer("asdf", "O", reader);
// const ai = new ComputerPlayer("Hal", "O");

const gameStarter = function() {
  const game = new Game(reader, human, ai);
  ai.board = game.board;
  game.run(gameCallback);
};

gameStarter();

// const game = new Game(reader);
// // console.log(game.currentPlayer);
// const pos = game.getMove();

// game.changePlayer();
// console.log(game.currentPlayer);
