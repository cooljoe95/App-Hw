Array.prototype.myEach = function(callback){
  for(let i = 0; i < this.length; i++){
    callback(this[i]);
  }
};

Array.prototype.myMap = function(callback){
  let result = [];

  this.myEach(function(el){
    result.push(callback(el));
  });

  return result;
};

Array.prototype.myInject = function(callback){
  let accumilator = this[0];
  let count = 0;
  this.myEach(function(el){
    if(count !== 0){
      accumilator = callback(accumilator, el);
    }
    count += 1;
  });
  return accumilator;
};
