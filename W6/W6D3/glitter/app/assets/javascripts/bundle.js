/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
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
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

// entry file:
// require everything
const FollowToggle = __webpack_require__(1);
const UsersSearch = __webpack_require__(2);

function runSetup () {
  // things
  buildToggles();
  buildSearch();

}

function buildToggles () {
  $('.follow-toggle').each ((index, el) => {
    let $el = $(el);
    let newTog = new FollowToggle($el);
  });
}

function buildSearch () {
  $('.users-search').each ((index, el) => {
    // let $el = $(el);
    let newSearch = new UsersSearch(el);
  });
}

$(runSetup);
window.runSetup = runSetup;


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class FollowToggle {

  constructor ($el) {
    // let $followButton = $('.follow-toggle'); // this is $el
    this.$el = $el;
    this.userId = $el.data("user-id"); // => now has button data in it
    this.followState = $el.data("initial-follow-state");
    this.render();

    // this.$el.on("click", this.handleClick);
    // this.$el.on("click", (event) => {
    //   event.preventDefault();
    //   this.handleClick();
    // });
    this.$el.on("click", this.handleClick.bind(this));
  }

  render () {
    this.$el.context.disabled = false;

    let fol = this.followState;
    if ( fol === false) {
      this.$el.text("Follow!");
    } else if (fol === true) {
      this.$el.text("Unfollow!");
    } else {
      alert('bananas');
    }
  }

  handleClick (event) {
    this.$el.context.disabled = true;
    //
    // let request = "POST";
    // if (this.followState === true) { request = "DELETE"; }

    let request = this.followState ? "DELETE" : "POST";

    let toggleAction = $.ajax({
      url: `/users/${this.userId}/follow`,
      method: request,
      dataType: "json"
    });

    toggleAction.then((response) => {
      this.followState = !this.followState;
      this.render();
    }, this.render.bind(this));
  }


} // class end

module.exports = FollowToggle;


/***/ }),
/* 2 */
/***/ (function(module, exports) {

class UsersSearch {
  constructor ($el) {
    this.$el = $el;
    this.$input = $('.users-search input').prop("value");
    this.$ul = $('.users-search ul');
    // this.input = $el.data();
  }

  searchUsers(queryVal, success) {
    $.ajax({
      url: "users/search",
      dataType: "json",
      method: "GET",
      data: {queryVal}
    });
  }

  handleInput () {
    // input? do things?
    this.searchUsers(/*more things*/);
  }

}

module.exports = UsersSearch;


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map