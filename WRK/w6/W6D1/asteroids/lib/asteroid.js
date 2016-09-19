/*
Asteroid

Write an Asteroid class in a lib/asteroid.js file. This should inherit from MovingObject.

Pick a default COLOR and RADIUS for Asteroids. Set these as properties of the
Asteroid class: Asteroid.COLOR and Asteroid.RADIUS.

Write your Asteroid constructor so that the caller specifies the pos and calls
the MovingObject superconstructor, setting color and radius to the Asteroid
defaults, and choosing a random vector for vel. You may want to consider writing
a Util.randomVec(length) helper function.

// Other properties are filled in for you.
new Asteroid({ pos: [30, 30] });
Why do we still need to call MovingObject's constructor function from within
Asteroid's constructor function?

Our inherits function sets up the prototype inheritance chain, which makes
methods available on the parent's prototype available to instances of the child
 class. However, we still need to call MovingObject's constructor function from
 within Asteroid's constructor function to access the code that sets properties
 such as this.pos and this.vel. Its the equivalent to calling super in a class's
 #initialize method in Ruby.

Note: Invoking an ES2015 class constructor without new (such as MovingObject
with call()) throws an error. Hence the need to use ES5 syntax for this project.
*/
const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');

function Asteroid(options){

  options.color = Util.randColor();
  options.radius = Math.random() * 30 + 5;
  options.vel = Util.randCoords(10);

  MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
// console.log(a = new Asteroid({pos:[10,10]}));
// console.log(a.move());
