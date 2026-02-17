//Build a function that returns an array of integers from n to 1 where n>0.
// Example : n=5 --> [5,4,3,2,1]

const reverseSeq = n => {
  let save = []
  if (Number(n)) {
    for (let i = 0; i < n; i++) {
    save[i] = n-i
    }
    return save
  } else {
    return [];  
  }
};




//Sample Test :
import { assert } from 'chai';

describe("reverseSeq", function() {
  it("Sample Test", function() {
    assert.deepEqual(reverseSeq(5), [5, 4, 3, 2, 1]);
  });
});