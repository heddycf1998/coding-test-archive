function getDivisorsCnt(n){
    let temp = 0
    for (let i = 1; i <= n; i ++) {
      if (n === 0) {
        return temp
      }
        if (n % i === 0) {
          temp = temp + 1
        }
    }
  return temp
}


// Sample Test :
import { assert } from "chai";

describe("Tests", () => {
  it("test", () => {
    assert.strictEqual(getDivisorsCnt(1),  1);
    assert.strictEqual(getDivisorsCnt(10), 4);
    assert.strictEqual(getDivisorsCnt(11), 2);
    assert.strictEqual(getDivisorsCnt(54), 8);
  });
});
