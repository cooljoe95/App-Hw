const Game = require('./towersOfHanoi');

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

const gameStarter = function() {
  reader.question('How many discs do you want to play with? ', function(answer) {
    const number = parseInt(answer);
    const game = new Game(reader, number);
    game.run(gameCallback);
  });
};

gameStarter();
