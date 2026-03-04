// Given a random non-negative number, you have to return the digits of this number within an array in reverse order.

// Example (Input => Output):
// 35231 => [1,3,2,5,3]
// 0     => [0]

function digitize(n) {
    let angka = n.toString()

    let array = []
    for (let i = 0; i < angka.length; i++) {
        array.unshift(angka[i])
    }
    return array.map(Number)
}




// Sample Test :
import { assert } from "chai";

describe("Basic tests", () => {
  it("Testing for fixed tests", () => {
    assert.deepEqual(digitize(35231),[1,3,2,5,3]);
    assert.deepEqual(digitize(0),[0]);
  });
});
