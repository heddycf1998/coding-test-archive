// You will be given an array of numbers. You have to sort the odd numbers in ascending order while leaving the even numbers at their original positions.

// Examples
// [7, 1]  =>  [1, 7]
// [5, 8, 6, 3, 4]  =>  [3, 8, 6, 5, 4]
// [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]  =>  [1, 8, 3, 6, 5, 4, 7, 2, 9, 0]

function sortArray(array) {
    let newArray = []
    for (let i = 0; i < array.length; i++) {
        if (array[i] % 2 !== 0) {
            newArray.push(array[i])
        }
    }

    newArray.sort((a, b) => a - b)
    let ganjilIdx = 0; 
    for (let i = 0; i < array.length; i++) {
        if (array[i] % 2 !== 0) {
            array[i] = newArray[ganjilIdx]; 
            ganjilIdx++;
        }
    }
    return array
}

// sortArray([5, 3, 2, 8, 1, 4])

import { assert } from "chai";

describe("Sample Tests", () => {
  it("should pass some sample tests", () => {
    assert.deepEqual(sortArray([5, 3, 2, 8, 1, 4]), [1, 3, 2, 8, 5, 4]);
    assert.deepEqual(sortArray([5, 3, 1, 8, 0]), [1, 3, 5, 8, 0]);
    assert.deepEqual(sortArray([]),[]);
  });
});
