/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	// const MovingObject = require('./lib/moving_object.js');
	// const Game = require('./lib/game.js');
	const GameView = __webpack_require__(6);

	const canvasEl = document.getElementsByTagName("canvas")[0];
	canvasEl.height = window.innerHeight;
	canvasEl.width = window.innerWidth;

	// const movingObj = new MovingObject(
	//   {
	//     pos: [40, 40],
	//     vel: [10, 10],
	//     radius: 10,
	//     color: "#749EF2"
	//   }
	// );
	// movingObj.draw(canvasEl);//.start(canvasEl);
	// movingObj.move().draw(canvasEl);

	const game = new GameView(canvasEl);
	game.start();


/***/ },
/* 1 */
/***/ function(module, exports) {

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


/***/ },
/* 2 */,
/* 3 */
/***/ function(module, exports, __webpack_require__) {

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

	const Asteroid = __webpack_require__(4);
	const Util = __webpack_require__(5);
	const Ship = __webpack_require__(7);

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


/***/ },
/* 4 */
/***/ function(module, exports, __webpack_require__) {

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
	const Util = __webpack_require__(5);
	const MovingObject = __webpack_require__(1);

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


/***/ },
/* 5 */
/***/ function(module, exports) {

	/*
	We want to allow our classes to inherit from another. We could monkey-patch
	Function to add an inherits method:

	Function.prototype.inherits = function (ParentClass) { ... };
	However, monkey-patching can cause problems and should be done judiciously.
	Instead, let's create a general utilities module in lib/util.js and add our
	first utility function to it as Util.inherits = function (childClass, parentClass) { ... }.

	Note: You should export a POJO (plain old JavaScript object) from Util, not a
	class. We don't need to create instances of Util.

	*/

	const Util = {

	  inherits: function(childClass, parentClass) {
	    function Surrogate() {}
	    Surrogate.prototype = parentClass.prototype;
	    childClass.prototype = new Surrogate();
	    childClass.prototype.constructor = childClass;
	  },

	  randCoords: function(maxVel) {
	    let a = [Math.random() * maxVel, Math.random() * maxVel];
	    if (Math.random() < 0.5){
	      a[0] = -a[0];
	    }
	    if (Math.random() < 0.5){
	      a[1] = -a[1];
	    }
	    return a;
	  },

	  randStartingPos: function(maxVel) {
	    const pos = [ [(Math.random() * maxVel), 0], [(Math.random() * maxVel), maxVel],
	    [0, (Math.random() * maxVel)], [maxVel, (Math.random() * maxVel)]];

	    return pos[Math.floor(Math.random() * 4)];
	  },

	  randColor: function() {
	    const pos = "0987654321ABCDEF";
	    let color = "#";
	    for (let i = 0; i < 6; i++) {
	      color += pos[Math.floor(Math.random() * 16)];
	    }
	    return color;
	  }
	};

	module.exports = Util;


/***/ },
/* 6 */
/***/ function(module, exports, __webpack_require__) {

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
	const Game = __webpack_require__(3);
	const Util = __webpack_require__(5);

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


/***/ },
/* 7 */
/***/ function(module, exports, __webpack_require__) {

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

	const Util = __webpack_require__(5);
	const MovingObject = __webpack_require__(1);

	function Ship(options = {}){

	  options.color = "#123456";
	  options.radius = 12;
	  options.vel = [0,0];
	  options.pos = Util.randStartingPos(500);
	  MovingObject.call(this, options);
	}

	Util.inherits(Ship, MovingObject);

	module.exports = Ship;


/***/ }
/******/ ]);