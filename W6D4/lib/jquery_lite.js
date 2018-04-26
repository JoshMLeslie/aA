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

const DOMNodeCollection = __webpack_require__(1);

function $l(selector) {
  let result;

  if (typeof selector === 'string') {
    result = Array
      .prototype
      .slice
      .call(document.querySelectorAll(selector), 0 );
  } else if (selector instanceof HTMLElement) {
    result = [selector];
  }
  return new DOMNodeCollection(result);
}

window.$l = $l;


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class DOMNodeCollection {
  constructor (elements) {
    this.elements = elements;
  }

  html (string) {
    if (string) {
      this.elements.forEach ((el) => {
        el.innerHTML = string;
      });
    } else {
      return el.innerHTML;
    }
  }

  empty () {
    this.html('');
  }

  append (element) {
    // (div).append(element)
    if (element instanceof DOMNodeCollection) {
      element.elements.forEach((el) => {
        this.elements[0].innerHTML += el.outerHTML;
      });
    } else if (element instanceof HTMLElement) {
      this.elements[0].innerHTML += element.outerHTML;
    } else if (typeof element === 'string') {
      this.elements[0].innerHTML += element;
    } else {
      console.log("What the hell?");
    }
  }

  attr (getter, setter) {
    // element.attributes
    if (getter) {
      if (setter) {
        // if setting (needs a specific k-v)
        this.elements[0].setAttribute(getter, setter);
      } else {
        // if a specific k-v is looked for
        return this.elements[0].getAttribute(getter);
      }
    } else {
      // if no args, return all k-v pairs
      return this.elements[0].attributes;
    }
  }

  addClass () {

  }

  removeClass () {

  }



}


module.exports = DOMNodeCollection;


/***/ })
/******/ ]);