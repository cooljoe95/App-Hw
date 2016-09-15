Array.prototype.my_uniq = function uniq(){

  function include(array, element){
    for(let i = 0; i < array.length; i++){
      if(array[i] === element){
        return true;
      }
    }
    return false;
  }

  let result = [];
  for(let i = 0; i < this.length; i++){
    if(!include(result, this[i])){
      result.push(this[i]);
    }
  }
  return result;
};

Array.prototype.twoSum = function(){
  let result = [];
  for(let i = 0; i < this.length; i++){
    for(let j = i+1; j < this.length; j++){
      if (this[i] + this[j] === 0){
        result.push([i, j]);
      }
    }
  }
  return result;
};

Array.prototype.transpose = function() {
  for(let i = 0; i < this.length; i++){
    for(let j = 0; j < i; j++){
      let temp = this[i][j];
      this[i][j] = this[j][i];
      this[j][i] = temp;
    }
  }
  return this;
};

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
