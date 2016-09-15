function titleize(array, callback){
	function printCallback(word){
		console.log(word)
	}
	phrases = array.map(el => "Mx. " + el + " Jingleheimer Schmidt")
	phrases.forEach(printCallback)
}

function Elephant(name, height, tricks){
	this.name = name;
	this.height = height;
	this.tricks = tricks;

}

Elephant.paradeHelper = function(elephant){
	console.log(elephant.name + " is trotting by!");
};

herd.forEach(el => Elephant.paradeHelper(el))

Elephant.prototype.trumpet = function (){
	console.log(this.name + " the elephant goes 'phrRRRRRRRRRRRRRR!!!!!!!!'")
};

Elephant.prototype.grow = function(){
	this.height+=12;
};

Elephant.prototype.addTrick = function(trick){
	this.tricks.push(trick);
};

Elephant.prototype.play = function(){
	tricks = this.tricks;
	activity = tricks[Math.floor(Math.random()*tricks.length)];
	console.log(this.name + " is " + activity);
};
// Needed to peek at solution for this one. 
function dinerBreakfast(){
	let order = "I want scrambled eggs and bacon please";
	console.log(order);

	return function(food){
		order = order.slice(0, order.length - 8) + " and " + food + " please.";
		console.log(order)
	}
}
