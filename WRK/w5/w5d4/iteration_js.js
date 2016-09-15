Array.prototype.my_uniq = function(){

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

Array.prototype.bubbleSort = function(){
  for(let i = 0; i < this.length; i++){
    for(let j = this.length - 1; j > i; j--){
      if (this[j] < this[i]){
        temp = this[j];
        this[j]=this[i];
        this[i] = temp;
      }
    }
  }
  return this;
};

function substrings(string){
  let result = [];
  for(let i = 0; i < string.length; i++){
    for(let j = i+1; j <= string.length; j++){
      result.push(string.slice(i,j));
    }
  }
  return result.my_uniq();
}
