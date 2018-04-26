const DOMNodeCollection = require('./dom_node_collection.js');

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
