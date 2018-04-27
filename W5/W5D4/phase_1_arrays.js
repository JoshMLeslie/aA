Array.prototype.uniq = function () {
  let result = [];

  for (let i = 0; i < this.length; i++) {
    let logic = false;

    for (let j = i + 1; j < this.length; j++) {
      if ( this[i] === this[j] ) {
        logic = true;
      }
    }

    if ( logic === false) {
      result.push(this[i]);
    }
  }
  return result;
  // console.log(result);
  // return => not showing (1,2,3,4)
  // console.log =>  shows (1,2,3,4)
};

// let abc = [1,2,3,4,3,4];
// console.log(abc.uniq());
// abc.uniq();
// class_object.function(argument)


Array.prototype.twoSum = function () {
  let result = [];

  for (let i = 0; i < this.length; i++) {


    for (let j = i + 1; j < this.length; j++) {
      if ( this[i] + this[j] === 0 ) {
        result.push( [i ,j] );
      }
    }
  }
  result.forEach((el) => (console.log(el) ) );
};
// let abc2 = [-1,1,-2,2,3,4]; // should be [ [0,1],[2,3] ]
// console.log(abc2.twoSum());

Array.prototype.transpose = function () {
  // assuming square arrays
  let result = [];
  this.forEach((el) => result.push([]) );
  // self.times { result.push([]) } // Ruby

  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this.length; j++) {
      result[j][i] = this[i][j];
    }
  }

  return result;
};

arrToTranspose = [[1,2,3],[4,5,6],[7,8,9]]; // [[1,4,7],[2,5,8][3,6,9]]
// arrToTranspose = [[7,8,9],[4,5,6],[1,2,3]]; // [[1,4,7],[2,5,8][3,6,9]]
console.log(arrToTranspose.transpose());








// end
