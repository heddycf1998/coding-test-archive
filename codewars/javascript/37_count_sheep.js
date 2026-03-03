var countSheep = function (num){
    if (num <= 0) {
        return ""
    }

    let temp = ""
    for (let i = 0; i < num; i++) {
        temp = temp + `${i+1} sheep...`
    }

    return temp
}




import { assert } from "chai";

describe("Fixed tests", () => {
  it("Testing for fixed tests", () => {
    assert.strictEqual(countSheep(0), "");
    assert.strictEqual(countSheep(1), "1 sheep...");
    assert.strictEqual(countSheep(2), "1 sheep...2 sheep...");
    assert.strictEqual(countSheep(3), "1 sheep...2 sheep...3 sheep...");
  });
});