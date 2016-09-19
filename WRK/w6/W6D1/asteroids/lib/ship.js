/*
Phase IIIa: Ship

In lib/ship.js, write an Ship class; this should be another subclass of MovingObject.
Define Ship.RADIUS and Ship.COLOR as before. I default initialize the vel to the zero vector.

In your Game constructor, build a Ship object. I used Game.prototype.randomPosition
 to place the Ship. Save your ship to an instance variable.

I wrote a Game.prototype.allObjects method that returned the array of Asteroids
 + the ship. I iterated through this in Game.prototype.draw, Game.prototype.moveObjects,
  and Game.prototype.checkCollisions

Update the MovingObject.prototype.collideWith(otherObject) logic. Stop removing
colliding asteroids; your MovingObject.prototype.collideWith should be empty.
 Instead, overwrite the superclass's method with Asteroid.prototype.collideWith(otherObject):
  if otherObject instanceof Ship, call Ship.prototype.relocate. The
  Ship.prototype.relocate method should reset the Ship's position to
  game.randomPosition() and reset velocity to the zero vector.
*/

const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');

function Ship(options = {}){

  options.color = "#123456";
  options.radius = 12;
  options.vel = [0,0];
  options.pos = Util.randStartingPos(500);
  MovingObject.call(this, options);
}

Util.inherits(Ship, MovingObject);

module.exports = Ship;
