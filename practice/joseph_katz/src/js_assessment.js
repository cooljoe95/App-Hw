// write String.prototype.mySlice. It should take a start index and an
// (optional) end index.
String.prototype.mySlice = function(startIndex, endIndex = this.length){
  const result = [];
  for(let i = startIndex; i < endIndex; i++){
    result.push(this[i]);
  }
  return result.join("");
};

// write Array.prototype.myReduce (analogous to Ruby's Array#inject).
Array.prototype.myReduce = function(callback){
  let accumilator = this[0];
  this.slice(1).forEach((el) => accumilator = callback(accumilator, el));
  return accumilator;
};

// write Array.prototype.quickSort(comparator). Here's a quick refresher if
// you've forgotten how quickSort works:
//   - choose a pivot element from the array (usually the first)
//   - for each remaining element of the array:
//     - if the element is less than the pivot, put it in the left half of the
//     array.
//     - otherwise, put it in the right half of the array.
//   - recursively call quickSort on the left and right halves, and return the
//   full sorted array.
Array.prototype.quickSort = function(comparator = function (x, y) {
  if (x == y) {
    return 0;
  } else if (x < y) {
    return -1;
  } else {
    return 1;
  }
}){
  if(this.length <= 1){
    return this;
  }
  let left = [];
  let right = [];
  for (let i = 1; i < this.length; i++){
    if (comparator(this[0], this[i]) === 1){
      left.push(this[i]);
    } else {
      right.push(this[i]);
    }
  }
  return left.quickSort(comparator).concat([this[0]]).concat(right.quickSort(comparator));
};

// write myFind(array, callback). It should return the first element for which
// callback returns true, or undefined if none is found.
function myFind(array, callback){
  for(let i = 0; i < array.length; i++){
    if(callback(array[i]) === true){
      return array[i];
    }
  }
  return undefined;
}

// write sumNPrimes(n)
function isPrime(n){
  if(n < 2){
    return false;
  }
  for(let i = 2; i < n; i++){
    if((n % i) === 0){
      return false;
    }
  }
  return true;
}

function sumNPrimes(n){
  let count = 0;
  let index = 1;
  let sum = 0;
  while (count < n){
    if(isPrime(index)){
      sum += index;
      count += 1;
    }
    index += 1;
  }
  return sum;
}

// write Function.prototype.myBind.
Function.prototype.myBind = function(object, ...args){
  const originalFunction = this;
  return function(...laterArgs){
    return originalFunction.apply(object, args.concat(laterArgs));
  };
};

// write Function.prototype.inherits.
Function.prototype.inherits = function(superClass){
  function Surrogate(){}
  Surrogate.prototype = superClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};
