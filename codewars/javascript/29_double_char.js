function doubleChar(str) {
  let temp = ""
  
  for (let i = 0; i < str.length; i++) {
      temp = temp + str[i] + str[i]
  }
  
  return temp
}



// Sample Test :
import { assert } from "chai";

describe("doubleChar", function() {
  it("works for some examples", function() {
    assert.strictEqual(doubleChar("abcd"), "aabbccdd");
    assert.strictEqual(doubleChar("Adidas"), "AAddiiddaass");
    assert.strictEqual(doubleChar("1337"), "11333377");
    assert.strictEqual(doubleChar("illuminati"), "iilllluummiinnaattii");
    assert.strictEqual(doubleChar("123456"), "112233445566");
    assert.strictEqual(doubleChar("%^&*("), "%%^^&&**((");
  });
});
