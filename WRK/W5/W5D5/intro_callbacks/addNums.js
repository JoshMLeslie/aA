const readline = require('readline');

const rl = readline.createInterface (
  {
    input: process.stdin,
    output: process.stdout
  }
);
//\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/


function addNumbers (sum, numsLeft, completionCallback) {
  if (numsLeft === 0) {
    rl.close();
    return completionCallback(sum);
  }

  sum = sum || 0; // default to 0

  console.log(`You can add ${numsLeft} more nums`);
  rl.question ('What\'s yo number, friend?  ', answer => {
     sum += parseInt(answer);
     console.log(`Your number is: ${sum}!`);
     addNumbers(sum, numsLeft-1, completionCallback);
  });


}


addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
