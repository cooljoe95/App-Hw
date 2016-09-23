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
	}

	module.exports = DOMNodeCollection;


/***/ }
/******/ ]);