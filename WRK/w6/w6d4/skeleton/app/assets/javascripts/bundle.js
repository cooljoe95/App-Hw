/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const FollowToggle = __webpack_require__(1);
	const UsersSearch = __webpack_require__(3);
	
	$(() => {
	  $('button.follow-toggle').each((index, value) => {
	    new FollowToggle(value);
	  });
	
	  $('nav.users-search').each((index, value) => {
	    new UsersSearch(value);
	  });
	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	class FollowToggle {
	  constructor(el, options) {
	    this.userId = $(el).data("user-id") || options.userId;
	    this.followState = options.followState || el.dataset.initialFollowState;
	    this.$el = $(el);
	    this.render();
	    this.$el.on("click", this.handleClick.bind(this)); //GOOD
	
	    // this.$el.on("click", this.handleClick); //BAD
	    // this.$el.on("click", (event) => this.handleClick(event));
	    // this.$el.on("click", FollowToggle.prototype.handleClick.bind(this)); //GOOD
	  }
	
	  render(){
	    const state = this.followState === "unfollowed" ? "Follow!" : "Unfollow!";
	    this.$el.text(state);
	  }
	
	  handleClick(event){
	    event.preventDefault();
	    let type = this.followState === "unfollowed" ? "POST" : "DELETE";
	    let followToggle = this;
	    this.followState = this.followState === "unfollowed" ? "following" : "unfollowing";
	    $.ajax({
	      url: `${this.userId}/follow`,
	      type: `${type}`,
	      dataType: 'json',
	      success(follow){
	        followToggle.followState = followToggle.followState === "following" ? "followed" : "unfollowed";
	        followToggle.$el.prop("disabled", false);
	        followToggle.render();
	      }
	    });
	    this.$el.prop("disabled", true);
	  }
	
	}
	
	module.exports = FollowToggle;


/***/ },
/* 2 */,
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	const FollowToggle = __webpack_require__(1);
	class UsersSearch{
	  constructor(el){
	    this.$el = $(el);
	    this.input = "";
	    this.$ul = $('.users');
	    this.$el.on("keyup", this.handleInput.bind(this));
	  }
	
	  handleInput (event) {
	    if (event.keyCode === 8){
	      this.input = this.input.slice(0, this.input.length-1);
	    } else {
	      this.input += event.key;
	    }
	    // this.$ul = this.$el.ul;
	    const query = this.input;
	    const $ul = this.$ul;
	    const renderResults = this.renderResults.bind(this);
	    $.ajax({
	      url: "./search",
	      type: 'GET',
	      data: { query: `${query}`},
	      dataType: 'json',
	      success(users){
	        renderResults(users);
	        // debugger
	      }
	    });
	  }
	
	  // <% if current_user.follows?(user) %>
	  //   <% follows = "followed" %>
	  // <% else %>
	  //   <% follows = "unfollowed" %>
	  // <% end %>
	
	  renderResults(users){
	    this.$ul.empty();
	    users.forEach( (value, index) => {
	      const $userAnchor = $("<a>").attr('href', `./${value.id}`);
	      $userAnchor.append(value.username);
	      const $userLi = $('<li>').append($userAnchor);
	      this.$ul.append($userLi);
	      const $followToggleButton = $("<button>").addClass("follow-toggle");
	      let followState;
	      if(value.followed){
	        followState = "followed";
	      } else {
	        followState = "unfollowed";
	      }
	      new FollowToggle($followToggleButton, {
	        "userId": value.id,
	        "followState": `${followState}`
	      });
	      console.log(value);
	      $userLi.append($followToggleButton);
	    });
	  }
	
	}
	
	module.exports = UsersSearch;


/***/ }
/******/ ]);
//# sourceMappingURL=bundle.js.map