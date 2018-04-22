Array.prototype.myBubbleSort = function () {
  let logic = false;

  if ( logic === false) {
    logic = true;
    for (let i = 0; i < this.length; i++) {
      for (let j = i + 1; j < this.length; j++ ) {
        if ( this[i] > this[j] ) {
          let temp = this[i];
          this[i] = this[j];
          this[j] = temp;
          logic = false;
        }
      }
    }

    return this;
  }
};

// TEST \\

// console.log([2,5,7,4].myBubbleSort());

// let temp = this[i];
// this[i] = this[j];
// this[j] = temp;

// temp = 1
// this[j] = 1
// this[i] = 2
//
// with temp
// j = 1 = > i = 1
// temp = 2 => j = 2
//
// without temp
// j = 1 => i = 1
// i = 1 => j = 1

String.prototype.mySubStrings = function () {
  // return all substrings
  // 'cat' => "c", "ca", "cat", "a", "at", "t"
  const result = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1 ; j <= this.length; j++ ) {
      let pie = this.slice(i, j);
      result.push(pie);
    }
  }

  return result;
};

console.log("cat".mySubStrings());
