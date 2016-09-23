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

window.$l.extend = function(first, ...rest) {
  for (let i = 0; i < rest.length; i++) {
    const hash = rest[i];
    Object.keys(hash).forEach ((key) => {
      first[key] = hash[key];
    });
  }
};


window.$l.ajax = function(options){
  function defaultResponse(){
    console.log(xhr.status); // for status info
    console.log(xhr.responseType); //the type of data that was returned
    console.log(xhr.response);
  }
  let defaults = {};
  defaults["type"] = 'GET';
  defaults["dataType"] = 'json';
  defaults["success"] = defaultResponse;
  defaults["url"] = './';
  defaults["error"] = defaultResponse
  defaults["data"] = '""';
  const xhr = new XMLHttpRequest();
  // debugger
  $l.extend(defaults, options);
  xhr.open(`${options.type}`, `${options.url}`);

  xhr.onload = function(){
    console.log(xhr.status); // for status info
    console.log(xhr.responseType); //the type of data that was returned
    console.log(xhr.response);
  };

  const optionalData = {
    dataType: `${options.dataType}`,
    data: `${options.data}`
  };

  xhr.send(optionalData);
};

$l.ajax({
  type: 'GET',
  url: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success(data) {
    console.log("We have your weather!");
    console.log(data);
  },
  error() {
    console.error("An error occurred.");
  },
});

function sayHi(){
  console.log("HI");
}
$l( () => {
  // debugger
  let a = $l('button');
  debugger

  $l(a).on("click", sayHi);
  // $l(a).off("click", sayHi);
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
