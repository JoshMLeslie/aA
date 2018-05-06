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

// $l( () => {
//   setTimeout( () => {
//        alert('page loaded'); } , 1500); }
// );



$l.extend = function(...args) {
  let first = Object.assign({}, args[0]);
  for (let i = 1; i < args.length; i++){
    first = Object.assign(first, args[i]);
  }
  return first;
};

$l.ajax = function (options) {
  let defaults = {
    success: console.log("success!"),
    error: console.log("error!"),
    url: "http://www.google.com",
    method: "GET",
    contentType: 'application/x-www-form-urlencoded; charset=UTF-8'
  };

  options = $l.extend(defaults, options);

  const xhr = new XMLHttpRequest();
  xhr.open(options.method, options.url);
  xhr.onload = function () {
    console.log(xhr.status); // for status info
    console.log(xhr.responseType); //the type of data that was returned
    console.log(xhr.response); //the actual response. For JSON api calls, this will be a JSON string
  };

  // const optionalData = { name: "User1", password : "123456" };
  xhr.send(optionalData);




};

$.ajax({
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
