function madLib(verb, action, noun){
	return "We shall " + verb + " the " + action + " " + noun + ".";
}

function isOdd(num){
	return num % 2 === 1;
}

function yell(string){
	var new_string = string.toUpperCase();
	return new_string + "!!!";
}

function isSubstring(searchString, subString){
	for(let i = 0; i < searchString.length; i++){
		let full = true;
		for(let j = 0; j < subString.length; j++){
			if (searchString.charAt(i+j) !== subString.charAt(j)){
			  full = false;
			}
		}
		if (full){
			return true;
		}
	}
	return false;
}

function fizzBuzz(array){
	let return_val = [];
	for(let i = 0; i < array.length; i++){
		if (array[i] % 3 === 0 && array[i] % 5 === 0 && array[i] % 15 !== 0){

		}
	}
}

function isPrime(number){
	for(let i = 2; i <= number/2; i++){
		if(number % i == 0){
			return false;
		}
	}
	return true;
}

function firstNPrimes(n){
	let vals = [];
	let i = 2
	while (n > 0){
		if (isPrime(i)){
			vals.push(i);
			n -= 1;
		}
		i++;
	}
	return vals;
}

function sumOfNPrimes(n){
	let primes = firstNPrimes(n);
	let sum = 0;
	for(let i = 0; i < primes.length; i++){
		sum += primes[i];
	}
	return sum;
}

function printChildren(parent, ...children){
	console.log(parent+"s children are:");
	for(let i = 0; i < children.length; i++){
		console.log(children[i]);
	}
}

function addThree (a, b, c) {
  return a + b + c;
}

var arr = [1,2,3];
// How can we use the spread operator to pass in arr?
addThree(...arr);

function dinnerTonightIs(food = "pizza"){
	console.log("Dinner tonight is " + food);
}
