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
/******/ 	return __webpack_require__(__webpack_require__.s = 1);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports) {

class DOMNodeCollection {
  constructor (elements) {
    this.elements = elements;
  }

  html (string) {
    // debugger
    if (string || string === "") {
      this.elements.forEach ((el) => {
        el.innerHTML = string;
        // debugger
      });
    } else {
      return this.elements[0].innerHTML;
    }
  }

  empty () { this.html(''); }

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

  className (setter) {
      if (setter) {
        // if setting
        this.elements[0].classlist.add(setter);
    } else {
      // if no args, return any / all classes
      return this.elements[0].classname;
    }
  }

  removeClass(classNym) {
    this.elements[0].classlist.remove(classNym);
  }

  children () {
    let children = [];
    this.elements.forEach ((el) =>{
        let kid = Array
          .prototype
          .slice
          .call(el.children, 0);
        children = children.concat(kid);
    });

    return new DOMNodeCollection(children);
  }

  parent(selector) {
    const output = [];
    let type = document.querySelectorAll(selector);

    this.elements.forEach((el) => {
      let dad = el.parentNode;
      if (!output.includes(dad)) {
        if (selector) {
          type.forEach((possibleParent) => {
            if (possibleParent === dad) {
              output.push(dad);
            }
          });
        } else {
          output.push(dad);
        }
      }
    });

    return new DOMNodeCollection(output);
  }

  find (selector) {
    let mom = [];

    if (selector) {
      this.elements.forEach ((el) => {
        let tempSet = el.querySelectorAll(selector);
      // change mom to an array
        mom = mom.concat(Array
        .prototype
        .slice
        .call(tempSet, 0));
      });
    } else {
      mom = this.elements;
    }


      return new DOMNodeCollection(mom);
  }

  remove () {
    this.elements.forEach((el) => { el.remove(); });
    this.elements = [];
  }

  on (type, listener) {
    this.elements.forEach((el) => {
      el.setAttribute(`data-event-${type}`, type);
      el.addEventListener(type, listener);
    });
  }

  off (type, listener) {
    this.elements.forEach((el) => {
      el.removeAttribute(`data-event-${type}`);
      el.removeEventListener(type, listener);
    });
  }


} // class end


module.exports = DOMNodeCollection;


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const DOMNodeCollection = __webpack_require__(0);

function $l(selector) {
  let result;

  if (typeof selector === 'string') {
    result = Array
      .prototype
      .slice
      .call(document.querySelectorAll(selector), 0 );
  } else if (selector instanceof HTMLElement) {
    result = [selector];
  } else if (selector instanceof Function ) {
    window.addEventListener( "load", selector );
  }
  return new DOMNodeCollection(result);

}

window.$l = $l;

$l( () => {
  setTimeout( () => {
       alert('page loaded'); } , 1500); }
);


/***/ })
/******/ ]);