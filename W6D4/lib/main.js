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
