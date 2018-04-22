Array.prototype.myEach = function (xyz) {
  // let result = [1,2,3];
  //
  // result.forEach((el) => (console.log(el) ) );
  //  => 1, 2, 3
  // callback = function () { console.log(el) };
  // result.myEach(callback);
  //  => 1, 2, 3

  for (let i = 0; i < this.length; i++) {
    xyz(this[i]);
  }
};

// TEST //
let testResult = [1,2,3];

// callback = function (el) {
//   console.log(el);
// };
//
// result.myEach(callback);

// callback = function (el) {
//   return ( el * 2);
// };
// result.myEach(callback);

// result.myEach((abc) => console.log(abc * 2));

Array.prototype.myMap = function (callMe) {
  const result = []; // always a mutable array object

  this.myEach( (eachEl) => result.push( callMe(eachEl) ) ); // => no return
  // console.log(result);
  // console.log();
  return result;
};

// console.log(testResult.myMap((testEl) => (testEl * 2)));


Array.prototype.myReduce = function (callback, initialValue) {

  let acc;
  let i = 0;
  if (initialValue === undefined) {
    acc = this[0];
    i = 1;
  } else {
    acc = initialValue;
  }

  let el;
  for (i; i < this.length; i++) {
    let el = this[i];
    acc = callback(acc, el);
  }

  console.log(acc);
};

// [1, 2, 3].myReduce(function(acc, el) {
//   return acc + el;
// }); // => 6
//
// [1, 2, 3].myReduce(function(acc, el) {
//   return acc + el;
// }, 25); // => 31





// end
