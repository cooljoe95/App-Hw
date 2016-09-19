function sum() {
  let sum = 0;
  for (let i = 0; i < arguments.length; i++) {
    sum += arguments[i];
  }
  return sum;
}

// console.log(sum(1, 2, 3));

function sumRest(...args) {
  let sum = 0;
  args.forEach((el) => {
    sum += el;
  });
  return sum;
}

// console.log(sumRest(1, 2, 3, 4));
Function.prototype.oldMyBind = function() {
  const object = arguments[0];
  const originalFunction = this;
  const originalArguments = Array.from(arguments).slice(1);
  return function () {
    const argArray = Array.from(arguments);
    // console.log(argArray);
    originalFunction.apply(object, originalArguments.concat(argArray));
  };
};

Function.prototype.myBind = function(...args) {
  const object = args[0];
  const originalFunction = this;
  const originalArguments = args.slice(1);
  return function(...newargs) {
    originalFunction.apply(object, originalArguments.concat(newargs));
  };
};

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

// console.log(markov.says.myBind(breakfast));
// markov.says("meow", "Ned");
// // // // Markov says meow to Ned!
// // // // true
// // //
// markov.says.myBind(breakfast, "meow", "Kush")();
// // // // Breakfast says meow to Kush!
// // // // true
// // //
// markov.says.myBind(breakfast)("meow", "a tree");
// // Breakfast says meow to a tree!
// // true
//
// console.log(markov.says.myBind(breakfast));
//
//
// markov.says.myBind(breakfast, "meow")("Markov");
// // Breakfast says meow to Markov!
// // true
//
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");


function curriedSum(number){
  const numbers = [];
  let count = 0;
  return function _curriedSum(newNumber){
    count++;
    if (count === number){
      return newNumber + numbers.reduce(function (el1, el2){
        return el1 + el2;
      });
    } else {
      numbers.push(newNumber);
      return _curriedSum;
    }
  };
}

// const newsum = curriedSum(4);
// console.log(newsum(5)(30)(20)(1)); // => 56

Function.prototype.curry1 = function(numArgs) {
  const args = [];
  let count = 0;
  const originalFunction = this;
  return function _curry(newArg){
    count++;
    args.push(newArg);
    if (count === numArgs){
      return originalFunction.apply(null, args);
    } else {
      return _curry;
    }
  };
};

Function.prototype.curry = function(numArgs) {
  const args = [];
  let count = 0;
  const originalFunction = this;
  return function _curry(newArg){
    count++;
    args.push(newArg);
    if (count === numArgs){
      return originalFunction.call(null, ...args);
    } else {
      return _curry;
    }
  };
};


function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

//sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`

// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// console.log(f1 = f1(6)); // = 30

// or more briefly:
console.log(sumThree.curry1(3)(4)(20)(6));
