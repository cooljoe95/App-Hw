const DOMNodeCollection = require("./dom_node_collection.js");

document.addEventListener("DOMContentLoaded", () => {
  window.$l = function(element){

    if(typeof element === "string"){
      // debugger
      return document.querySelectorAll(element);
    } else if (typeof element === 'object') {
      if(element instanceof HTMLElement){
        // debugger
        return new DOMNodeCollection([element]);
      }
    }

  };

  // document.querySelectorAll()
  // debugger
  // console.log($l('ul'));
  let a = $l('ul');
  let b = $l(a[0]);
});
