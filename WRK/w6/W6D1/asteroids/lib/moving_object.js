/*
MovingObject

Write a MovingObject class in lib/moving_object.js.

Store key instance variables:

2D position. 2D velocity. radius (everything in the game is a circle).
color
Rather than pass all these as separate arguments, write your MovingObject
constructor function so that you can pass in an options object:

const mo = new MovingObject(
  { pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00"}
);
Write a MovingObect.prototype.draw(ctx) method. Draw a circle of the appropriate
 radius centered at pos. Fill it with the appropriate color. Refer to the Drunken
  Circles demo if you need a refresher on Canvas.

Write a MovingObject.prototype.move method. Increment the pos by the vel.

Write a MovingObject.prototype.isCollidedWith(otherObject) method. Two circles
 have collided if the distance between their center points is less than the sum
  of their radii.
*/

function MovingObject(options){
  this.posX = options.pos[0];
  this.posY = options.pos[1];

  this.velX = options.vel[0];
  this.velY = options.vel[1];

  this.radius = options.radius;
  this.color = options.color;
}

MovingObject.prototype.draw = function(ctx){
  ctx = ctx.getContext("2d");
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.posX,
    this.posY,
    this.radius,
    0,
    2 * Math.PI,
    false
  );

  ctx.fill();
};

MovingObject.prototype.isCollidedWith = function(otherObject){
  const distance = Math.sqrt(
               (this.posX - otherObject.posX) * (this.posX - otherObject.posX) +
               (this.posY - otherObject.posY) * (this.posY - otherObject.posY));
  if((this.radius + otherObject.radius) >= distance){
    return true;
  }
  return false;
};

MovingObject.prototype.move = function(maxX, maxY) {
  this.posX += this.velX;
  if (this.posX + this.radius > maxX) {
    this.posX = this.radius + 5;
  }
  if (this.posX < this.radius) {
    this.posX = (maxX - this.radius) - 5;
  }
  this.posY += this.velY;
  if (this.posY + this.radius > maxY) {
    this.posY = this.radius + 5;
  }
  if (this.posY < this.radius) {
    this.posY = (maxY - this.radius) - 5;
  }
  return this;
};

module.exports = MovingObject;
