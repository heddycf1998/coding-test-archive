// This kata is about multiplying a given number by eight if it is an even number and by nine otherwise.

function simpleMultiplication(number) {
    if (Number(number) % 2 === 0) {
      return number * 8
    } else if (Number(number) % 2 !== 0) {
      return number * 9 
    } else {
      return 'You have to give a Number'
    }
}




// Sampel Test :
import { assert } from "chai";

describe("Basic Tests", () => {
  it("Testing for fixed tests", () => {
    assert.strictEqual(simpleMultiplication(2),16,'Should return given argument times eight...')
    assert.strictEqual(simpleMultiplication(1),9, 'Should return given argument times nine...')
    assert.strictEqual(simpleMultiplication(8),64,'Should return given argument times eight...')
    assert.strictEqual(simpleMultiplication(4),32,'Should return given argument times eight...')
    assert.strictEqual(simpleMultiplication(5),45,'Should return given argument times nine...')
  });
});