// Introduction
// The first century spans from the year 1 up to and including the year 100, the second century - from the year 101 up to and including the year 200, etc.
// Task
// Given a year, return the century it is in.
// Examples
// 1705 --> 18
// 1900 --> 19
// 1601 --> 17
// 2000 --> 20
// 2742 --> 28
// Note: this kata uses strict construction as shown in the description and the examples, you can read more about it here

function century(year) {
//   let count = 0
//   for (let i = year; i > 0; i = i - 100) {
//     count = count + 1
//   }
//   console.log(count)
  return Math.ceil(year/100)
}




// Sample Test :
import { assert } from "chai";

describe("Tests", () => {
  it("test", () => {
    assert.strictEqual(century(1705), 18, 'Testing for year 1705');
    assert.strictEqual(century(1900), 19, 'Testing for year 1900');
    assert.strictEqual(century(1601), 17, 'Testing for year 1601');
    assert.strictEqual(century(2000), 20, 'Testing for year 2000');
    assert.strictEqual(century(89), 1, 'Testing for year 89');
  });
});