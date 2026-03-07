// You will be given an array a and a value x. All you need to do is check whether the provided array contains the value.

// a can contain numbers or strings. x can be either.

// Return true if the array contains the value, false if not.

function check(a, x) {
    for (let i = 0; i < a.length; i++) {
        if (a[i] === x) {
            return true;
        }
    }

    return false
}

check([66, 101], 66)


import { assert } from "chai";

describe("Basic tests",() =>{
  it("Testing for fixed tests", () => {
    assert.strictEqual(check([66, 101], 66), true);
    assert.strictEqual(check([101, 45, 75, 105, 99, 107], 107), true);
    assert.strictEqual(check(['t', 'e', 's', 't'], 'e'), true);
    assert.strictEqual(check(['what', 'a', 'great', 'kata'], 'kat'), false);
  })
})