
Function.prototype.inherits = function(parentPrototype){
  function Surrogate() {}
  Surrogate.prototype = parentPrototype.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

//
// function Cat() {
//
// }
// sennacy = new Cat();
// sennacy === {
//   name: 'senncay',
//   __proto__: (Cat.prototype)
// }
// sennacy.constructor ==> Animal;
//
// Cat.prototype === {
//   // constructor: Cat
//   __proto__: (Animal.prototype)
// };

function MovingObject (name) {
  this.name = name;
}


MovingObject.prototype.sayHi = function () {
  console.log("hi");
};
const movingObj = new MovingObject("bob");






function Ship (name, speed) {
  // super(name);
  this.speed = speed;
}


Ship.inherits(MovingObject);
Ship.prototype.sayBye = function() {
  console.log("bye");
};


// console.log(Ship.__proto__.__proto__);
const ship = new Ship("joe", 99);

console.log(MovingObject.prototype);
console.log(Ship.prototype);

console.log(ship.name);
console.log(ship.speed);
ship.sayHi();

ship.sayBye();

// movingObj.sayBye();


function Asteroid () {}
Asteroid.inherits(MovingObject);
