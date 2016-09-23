/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const DOMNodeCollection = __webpack_require__(1);

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


/***/ },
/* 1 */
/***/ function(module, exports) {

	class DOMNodeCollection {
	  constructor(elements) {
	    // debugger
	    this.elements = elements;
	  }

	  html(tag){
	    if(tag){
	      this.elements.forEach((el) => {
	        el.innerHTML = tag;
	      });
	    } else {
	      return this.elements[0].innerHTML;
	    }
	  }

	  empty(){
	    // debugger
	    this.html(" ");
	  }

	  append(tags){
	    this.elements.forEach((el) => {
	      if (tags instanceof HTMLElement) {
	        el.innerHTML += tags.innerHTML;
	      } else if(typeof tags === 'string'){
	        el.innerHTML += tags;
	      } else if(typeof tags === 'object'){
	        for (let i = 0; i < tags.length; i++) {
	          el.innerHTML += tags[i].outerHTML;
	        }
	      }
	    });
	  }

	  attr(get, set){
	    for(let i = 0; i < this.elements.length; i++){
	      if(typeof set === 'undefined'){
	        if(this.elements[i].hasAttribute(get)){
	          return this.elements[i];
	        }
	      } else {
	        this.elements[i].setAttribute(get, set);
	      }
	    }
	  }

	  addClass(className){
	    for (let i = 0; i < this.elements.length; i++) {
	      let initialClass = this.elements[i].getAttribute("class");
	      initialClass = initialClass === null ? className : initialClass + " " + className;
	      this.elements[i].setAttribute("class", initialClass);
	    }
	  }

	  removeClass(className) {
	    if (typeof className === "undefined") {
	      this.attr("class", "  ");
	    } else {
	      this.elements.forEach ((el) => {
	        let splitAr = el.getAttribute("class").split(" ");
	        const classNames = splitAr.splice(splitAr.indexOf(className), 1);
	        el.setAttribute("class", splitAr);
	      });
	    }
	  }

	  children(){
	    const children = [];

	    this.elements.forEach ((el) => {
	      children.push(el.childNodes);
	    });
	    return new DOMNodeCollection(children);
	  }

	  parent() {
	    const parent = [];
	    this.elements.forEach ((el) => {
	      parent.push(el.parentNode);
	    });
	    return new DOMNodeCollection(parent);
	  }

	  find(selector) {
	    const result = [];
	    this.elements.forEach ((el) => {
	      // debugger
	      const nodes = el.querySelectorAll(selector);
	      if(nodes.length > 0){
	        result.push(nodes);
	      }
	    });
	    return new DOMNodeCollection(result);
	  }

	  remove(selector){
	    const removeMe = this.find(selector);
	  // debugger
	    removeMe.elements.forEach((el) => {
	      el.forEach ((subEl) => {
	        subEl.remove();
	      });
	    });
	  }

	  on(action, callback) {
	    this.elements.forEach ((el) => {
	      el.addEventListener(action, callback);
	    });
	  }

	  off(action, callback){
	    this.elements.forEach((el) => {
	      el.removeEventListener(action, callback);
	    });
	  }
	}

	module.exports = DOMNodeCollection;


/***/ }
/******/ ]);