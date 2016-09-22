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

	const HanoiGame = __webpack_require__(1);
	const HanoiView = __webpack_require__(2);

	$( () => {
	  const rootEl = $('.hanoi');
	  const game = new HanoiGame();
	  new HanoiView(game, rootEl);

	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	class Game {
	  constructor() {
	    this.towers = [[3, 2, 1], [], []];
	  }

	  isValidMove(startTowerIdx, endTowerIdx) {
	      const startTower = this.towers[startTowerIdx];
	      const endTower = this.towers[endTowerIdx];

	      if (startTower.length === 0) {
	        return false;
	      } else if (endTower.length === 0) {
	        return true;
	      } else {
	        const topStartDisc = startTower[startTower.length - 1];
	        const topEndDisc = endTower[endTower.length - 1];
	        return topStartDisc < topEndDisc;
	      }
	  }

	  isWon() {
	      // move all the discs to the last or second tower
	      return (this.towers[2].length == 3) || (this.towers[1].length == 3);
	  }

	  move(startTowerIdx, endTowerIdx) {
	      if (this.isValidMove(startTowerIdx, endTowerIdx)) {
	        this.towers[endTowerIdx].push(this.towers[startTowerIdx].pop());
	        return true;
	      } else {
	        return false;
	      }
	  }

	  print() {
	      console.log(JSON.stringify(this.towers));
	  }

	  promptMove(reader, callback) {
	      this.print();
	      reader.question("Enter a starting tower: ", start => {
	        const startTowerIdx = parseInt(start);
	        reader.question("Enter an ending tower: ", end => {
	          const endTowerIdx = parseInt(end);
	          callback(startTowerIdx, endTowerIdx);
	        });
	      });
	  }

	  run(reader, gameCompletionCallback) {
	      this.promptMove(reader, (startTowerIdx, endTowerIdx) => {
	        if (!this.move(startTowerIdx, endTowerIdx)) {
	          console.log("Invalid move!");
	        }

	        if (!this.isWon()) {
	          // Continue to play!
	          this.run(reader, gameCompletionCallback);
	        } else {
	          this.print();
	          console.log("You win!");
	          gameCompletionCallback();
	        }
	      });
	  }
	}

	module.exports = Game;


/***/ },
/* 2 */
/***/ function(module, exports) {

	class HanoiView {
	  constructor(game, $el){
	    this.game = game;
	    this.$el = $el;
	    this.setupTowers();
	    this.render();
	    this.fromTower = null;
	    this.bindEvents();
	  }

	  setupTowers(){
	    for(let i = 0; i < 3; i++){
	      const $ul = $("<ul>");
	      $ul.data('tower', i);
	      for (let j = 2; j >= 0; j--) {
	        const $li = $('<li>');
	        $li.data('pos', [i, j]);
	        $ul.append($li);
	      }
	      this.$el.append($ul);
	    }
	  }

	  render() {
	    const $li = $('li');
	    $li.removeClass();
	    for(let i = 0; i < $li.length; i++){
	      const $currentLi = $($li[i]);
	      const pos = $currentLi.data('pos');
	      const diskSize = this.game.towers[pos[0]][pos[1]];
	      if(diskSize){
	        $currentLi.addClass('disk');
	        $currentLi.addClass(`disk-${diskSize}`);
	      }
	    }
	  }

	  bindEvents(){
	    const $ul = $('ul');
	    $ul.on("click", function(e) {
	      const $currentTarget = $(e.currentTarget);
	      this.clickTower($currentTarget);
	      if(this.game.isWon()){
	        const $h1 = $("<h1>");
	        $h1.text("Congratulations!!! You Win!!!");
	        this.$el.append($h1);
	        $ul.off();
	        this.restartGame();
	      }
	    }.bind(this));
	  }

	  restartGame(){
	    const $button = $('<a>');
	    $button.attr("href", "file:///Users/appacademy/Desktop/skeleton/toh/skeleton/index.html");
	    $button.text("Restart Game");
	    this.$el.append($button);
	  }

	  clickTower($tower) {
	    if (this.fromTower === 0 || this.fromTower) {
	      const toTower = $tower.data('tower');
	      if(!this.game.move(this.fromTower, toTower)){
	        alert("What you thinking about Willis?");
	      }
	      this.fromTower = null;
	      $('ul').removeClass();
	    } else {
	      this.fromTower = $tower.data('tower');
	      $tower.addClass('selected-tower');
	    }
	    this.render();
	  }
	}
	module.exports = HanoiView;


/***/ }
/******/ ]);