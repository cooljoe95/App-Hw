/*
Game

Game will be in charge of holding all of our moving objects. It will also contain
 the logic for iterating through these objects and calling their corresponding
 move methods.

Write a Game class in lib/game.js. Define the following constants on the Game
class: DIM_X, DIM_Y, and NUM_ASTEROIDS.

Write a Game.prototype.addAsteroids method. Randomly place the asteroids within
the dimensions of the game grid. You may also wish to write a
Game.prototype.randomPosition method. Store the asteroids in an instance variable
array asteroids. Call addAsteroids in your constructor.

Write a Game.prototype.draw(ctx) method. It should call clearRect on the ctx to
wipe down the entire space. Call the draw method on each of the asteroids.

Write a Game.prototype.moveObjects method. It should call move on each of the asteroids.

Next, write a Game.prototype.checkCollisions that iterates through the asteroids
 and alert("COLLISION"); whenever two collide. Make sure not to check if an asteroid
 collides with itself.

Write a Game.prototype.step method, which calls Game.prototype.moveObjects then
Game.prototype.checkCollisions. Call this in GameView.prototype.start instead of
moveObjects directly.
*/

const Asteroid = require('./asteroid.js');
const Util = require('./utils.js');
const Ship = require('./ship.js');

function Game(){
  this.DIM_X = 700;
  this.DIM_Y = 700;
  this.NUM_ASTEROIDS = 8;
  this.asteroids = [];
  this.ship = new Ship();
  this.addAsteroids();
}

Game.prototype.addAsteroids = function () {
  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    this.asteroids.push(new Asteroid({pos: Util.randStartingPos(600)}));
  }
};

Game.prototype.allObjects = function(){
  return this.asteroids.concat([this.ship]);
};

Game.prototype.checkCollisions = function() {
  for(let i = 0; i < this.allObjects().length; i++){
    for(let j = i + 1; j < this.allObjects().length; j++){
      if(this.allObjects()[i].isCollidedWith(this.allObjects()[j])){
        this.remove(this.allObjects()[i]);
        this.remove(this.allObjects()[j]);
      }
    }
  }
};

Game.prototype.remove = function(asteroid) {
  this.asteroids.splice(this.asteroids.indexOf(asteroid), 1);
};

Game.prototype.draw = function (ctx) {
  const ctx2 = ctx.getContext("2d");
  ctx2.clearRect(0, 0, 700, 700);
  for (let i = 0; i < this.allObjects().length; i++){
    this.allObjects()[i].draw(ctx);
  }
};

Game.prototype.moveObjects = function () {
  this.allObjects().forEach((allObject) => allObject.move(this.DIM_X, this.DIM_Y));
};

module.exports = Game;
