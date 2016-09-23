const DOMNodeCollection = require("./dom_node_collection.js");

const queue = [];

window.$l = function(element){

  if(typeof element === "function"){
    queue.push(element);
  }
  document.addEventListener("DOMContentLoaded", () => {
    for (let i = 0; i < queue.length; i++) {
      queue.shift()();
    }
  });
  if(typeof element === "string"){
    return Array.from(document.querySelectorAll(element));
  } else if (typeof element === 'object') {
    if(element[0] instanceof HTMLElement){
      return new DOMNodeCollection(element);
    }
  }
};

$l( () => {
  let a = $l('button');

  // $l(a).on("click", (e)=>sayHi);
  // $l(a).off("click", (e)=>sayHi);
});
  // document.querySelectorAll()
  // debugger
  // console.log($l('ul'));
  // let a = $l('ul');
  // let b = $l(a);
  // console.log(b.html());
  // b.append(" Bye ");
  // b.append(a[0]);
  // // b.empty();
  // b.addClass("test");
  // console.log(b.attr("name"));
  // b.removeClass("test");
  // let c = $l('div');
  // $l(c).append(a[0]);
  // console.log(b.children());
  // console.log($l(c).find('p'));
  // debugger
  // $l(c).remove('ul');
  // $l(a).off("click");
  // let a = $l('div');
  // $l(a).remove('ul');
