function Cat(name, owner){
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement= function(){
  return this.owner + " loves " + this.name;
};

joe = new Cat("Fluffy", "Joe");
jill = new Cat("Meow Meow", "Jill");
jon = new Cat("Queen Catnip the 32nd", "Jon");
josh = new Cat("Buttercup", "Josh");

console.log(joe.cuteStatement());
console.log(jon.cuteStatement());

Cat.prototype.cuteStatement= function(){
  return "Everybody loves " + this.name;
};

console.log(joe.cuteStatement());
console.log(jon.cuteStatement());

Cat.prototype.meow = function(){
  return "MEEEEOOOOOOWWWW!!";
};

joe.meow = function(){
  return "PUUURRRR";
};

console.log(joe.meow());
console.log(jon.meow());
