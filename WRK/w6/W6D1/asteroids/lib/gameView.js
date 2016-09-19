/*
GameView

Your GameView class will be responsible for keeping track of the canvas context,
the game, and the ship. Your GameView will be in charge of setting an interval
to animate your game. In addition, it will eventually bind key handlers to the
ship so that we can move it around.

Define an GameView class in lib/game_view.js. The GameView should store a Game
and take in and store a drawing ctx.

Write a GameView.prototype.start method. It should call setInterval to call
Game.prototype.moveObjects and Game.prototype.draw once every 20ms or so.
*/
const Game = require('./game.js');
const Util = require('./utils.js');

// const canvasEl = document.getElementsByTagName("canvas")[0];
// canvasEl.height = window.innerHeight;
// canvasEl.width = window.innerWidth;

function GameView(ctx) {
  this.ctx = ctx;
  this.game = new Game();
}

GameView.prototype.start = function () {
  setInterval(function(){
    this.game.draw(this.ctx);
    this.game.moveObjects();
    this.game.checkCollisions();
  }.bind(this), 20);
  setInterval(function() {
    this.game.asteroids.forEach((asteroid) => {
      asteroid.color = Util.randColor();
    });
  }.bind(this), 200);
};

module.exports = GameView;
