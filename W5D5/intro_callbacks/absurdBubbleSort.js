const readline = require('readline');

const rl = readline.createInterface (
  {
    input: process.stdin,
    output: process.stdout
  }
);

const askIfGreaterThan = (el1, el2, callback) => {
  rl.question(`Is ${el1} greater than ${el2}?`, answer => {
    // debugger;
    try {
      if (
          yesNo(answer)
        ) throw "pizza";
    }
    catch(error) {
      console.log(error);
      answer = 'no';
    }
    // debugger;
    callback(answer === 'yes');
    rl.close();
  });
};

const yesNo = (answer) => {
  (answer != 'yes' && answer === 'no') ||
  (answer != 'no' && answer === 'no');
};

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
// untested function. completely untested. none whatsoever.
  if (i < arr.length - 1) {
    let el1 = arr[i];
    let el2 = arr[i+1];
    // isGreaterThan = boolean
    askIfGreaterThan(el1, el2, (isGreaterThan) => {
      if (isGreaterThan) {
        // if left > right
        let temp = el1;
        arr[i] = el2;
        arr[i+1] = temp;
      }
    });


  }
}



askIfGreaterThan(2,3,result => console.log(`${result}`));
