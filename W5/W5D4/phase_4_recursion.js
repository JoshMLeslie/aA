// yay. recursion.

//  function range (start, end, logic) {
//
//   const result = [];
//
//   if (logic) {
//     for (let i = start; i <= end; i++) {
//       result.push(i);
//     }
//   } else {
//     for (let i = start; i < end; i++) {
//       result.push(i);
//     }
//   }
//
//
//   return result;
// }

//
// console.log(range(0, 2));
// console.log(range(0, 0));
// console.log(range(0, 10, true));

// end -= 1
// return start when start === end

function range(start, end /*, logic*/) {
  const result = [];

  // let selector = [];
  // if (logic) {
  //   selector.push(end);
  // }

  if (start === end) {
    // return selector; // => returns length of result
    return [];
  }
  result.push(start); // recursive call
  return result.concat(range(start+1, end /*, logic*/));

  // return result;
}
// console.log(result);

// console.log(range(2, 4));
// // console.log(range(0, 0));
// console.log(range(0, 4, true));


function sumRec(arr) {
  // const result = 0;

  if (arr.length === 1) {
    return arr[0];
  }

  // 1 + [2,3,4,5]
  // ...
  // 1 + 2 + 3 + 4 + 5
  let result = arr[0] + sumRec(arr.slice(1,arr.length));
  return result;
}
//
// console.log(sumRec([1]));
// console.log(sumRec([1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4]) === 60);

function exponentRecOne(base, exp) {
  if (exp === 0) { return 1; }
  return base * exponentRecOne(base,exp-1);
}

// console.log(exponentRecOne(2,3)); // => 8
// console.log(exponentRecOne(2,4)); // => 16
// console.log(exponentRecOne(3,2)); // => 9

function exponentRecTwo(base, exp) {

  if (exp === 0) {
    return 1;
  }

  if (exp === 1) {
    return base;
  }

//   exp(b, n / 2) ** 2             [for even n]
//   exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]
  if ( (exp % 2) === 0) {
    return (exponentRecTwo(base, exp / 2 ) ** 2);
  } else {
    return base * (exponentRecTwo(base, (exp - 1) / 2 ) ** 2);
  }
}

// console.log(exponentRecTwo(2,3)); // => 8
// console.log(exponentRecTwo(2,4)); // => 16
// console.log(exponentRecTwo(3,2)); // => 9
// console.log(exponentRecTwo(3,3)); // => 27

function fibBuilder(n) {
// not working currently but seems close

  // first n fibonacci numbers
  // n = 3 => 1 , 1 , 2
  let result = [];
  let i = 0;
  while (result.length < n) {
    result.push(fibMaker(i))
    i++
  }
}

function fibMaker(n) {
  // make fib of position n, recursively
  if (n <= 1) return 1;

  return fibMaker(n - 1) + fibMaker(n - 2);
}

console.log(fibBuilder(3));









// end
