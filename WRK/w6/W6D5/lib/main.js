const DOMNodeCollection = require("./dom_node_collection.js");

document.addEventListener("DOMContentLoaded", () => {
  window.$l = function(element){

    // debugger
    if(typeof element === "string"){
      return Array.from(document.querySelectorAll(element));
    } else if (typeof element === 'object') {
      if(element[0] instanceof HTMLElement){
        return new DOMNodeCollection(element);
      }
    }

  };

  // document.querySelectorAll()
  // debugger
  // console.log($l('ul'));
  let a = $l('ul');
  let b = $l(a);
  console.log(b.html());
  b.html("HI");
  b.append(" Bye ");
  b.append(a[0]);
  // b.empty();
});
