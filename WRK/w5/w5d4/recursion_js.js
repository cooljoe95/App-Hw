function warmup(start, end){
  if (end < start){
    return [];
  }
  ar = warmup(start, end-1);
  ar.push(end);
  return ar;
}

function sum(array){
  let sum = 0;
  for(let i = 0; i < array.length; i++){
    sum += array[i];
  }
  return sum;
}

function rec_sum(array){
  if (array.length === 0){
    return 0;
  }
  return rec_sum(array.slice(1)) + array[0];
}

function exponentation(base, exp){
  if(exp < 0){
    return 0;
  }
  else if(exp === 0){
    return 1;
  }
  else {
    return base * exponentation(base, exp - 1);
  }
}

function fibonacci(num){
  if(num <= 0){
    return [];
  }
  else if (num === 1) {
    return [1];
  }
  else if (num === 2) {
    return [1, 1];
  }
  else {
    array = fibonacci(num - 1);
    array.push(array[array.length - 1] + array[array.length - 2]);
    return array;
  }
}

function binarySearch(array, target){
  if (array.length === 0){
    return null;
  }
  midpoint = Math.floor(array.length / 2);
  if (array[midpoint] === target){
    return midpoint;
  }
  else if (array[midpoint] > target) {
    return binarySearch(array.slice(0, midpoint), target);
  }
  else {
    const right = binarySearch(array.slice(midpoint + 1, array.length), target);
    if(right === null){
      return null;
    }
    else{
      return (Math.floor(array.length / 2) + 1 + right);
    }
  }
}

function make_change(amt, coins){
  let fewestCoin = amt;
  let fewestCoins = [];
  let workingCoins = [];
  let count = 0;
  function find_fewest(new_amt){
    if (new_amt === 0){
      if (count <= fewestCoin){
        fewestCoin = count;
        fewestCoins = [];
        workingCoins.forEach((el) => fewestCoins.push(el));
      }
      return;
    }
    for(let i = 0; i < coins.length; i++){
      if (new_amt >= coins[i]){
        new_amt -= coins[i];
        count += 1;
        workingCoins.push(coins[i]);
        find_fewest(new_amt);
        workingCoins.pop();
        count -= 1;
        new_amt += coins[i];
      }
    }
  }

  find_fewest(amt);
  return fewestCoins;
}

Array.prototype.mergeSort = function(){
  function merge(left, right){
    result = [];
    while(left.length > 0 && right.length > 0){
      if (left[0] < right[0]){
        result.push(left.shift());
      }
      else{
        result.push(right.shift());
      }
    }
    while(left.length > 0){
      result.push(left.shift());
    }
    while(right.length > 0){
      result.push(right.shift());
    }
    return result;
  }
  if (this.length <= 1){
    return this;
  }
  let midpoint = Math.floor(this.length/2);
  let left = this.slice(0,midpoint).mergeSort();
  let right = this.slice(midpoint , this.length).mergeSort();
  return merge(left, right);
};

function subsets(array){

  function rec_sub(sub_array){
    if (sub_array.length === 0){
      return [];
    }
    else if (sub_array.length === 1) {
      return [[sub_array[0]], []];
    }
    else {
        let half = rec_sub(sub_array.slice(0,sub_array.length - 1));
        const size = half.length;
        for(let i = 0; i < size; i++){
          let part = half[i].slice();
          part.push(sub_array[sub_array.length - 1]);
          half.push(part);
          
        }
        return half;
      }
    }
  return rec_sub(array);
}

function exponentation2(base, exp){
  if (exp === 0) {
    return 1;
  }
  else if (exp === 1) {
    return base;
  }
  else if (exp % 2 === 0) {
    const sqrt = exponentation2(base, exp / 2);
    return sqrt * sqrt;
  }
  else {
    const sqrt = exponentation2(base, (exp-1)/2);
    return sqrt * sqrt * base;
  }
}
