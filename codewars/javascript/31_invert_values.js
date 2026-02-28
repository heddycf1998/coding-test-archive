// Given a set of numbers, return the additive inverse of each. Each positive becomes negatives, and the negatives become positives.
// [1, 2, 3, 4, 5] --> [-1, -2, -3, -4, -5]
// [1, -2, 3, -4, 5] --> [-1, 2, -3, 4, -5]
// [] --> []
// You can assume that all values are integers. Do not mutate the input array.

function invert(array) {
    let newArray = [...array]

    if (newArray.length < 0) {
        return []
    }

    for (let i = 0; i < newArray.length; i++) {
        newArray[i] = newArray[i] * -1
        if (newArray[i] === -0) {
            newArray[i] = 0
        }
    }
    return newArray
}




// Sample Test :
import { assert } from "chai";

describe("Invert array values",() => {
  const norm = arr => arr.map(n => n === -0 ? 0 : n);
  it("Basic Tests", () => {
    assert.deepEqual(norm(invert([1,2,3,4,5])), [-1,-2,-3,-4,-5]);
    assert.deepEqual(norm(invert([1,-2,3,-4,5])), [-1,2,-3,4,-5]);
    assert.deepEqual(norm(invert([])), []);
    assert.deepEqual(norm(invert([0])), [0]);
  });
});