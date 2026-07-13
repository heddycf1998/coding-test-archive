// Write a function that accepts a non-negative integer n and a string s as parameters, and returns a string of s repeated exactly n times.
// Examples (input -> output)
// 6, "I"     -> "IIIIII"
// 5, "Hello" -> "HelloHelloHelloHelloHello"

function repeatStr (n, s) {
  if(Number(n) > 0) {
    let nilaiS = s.toString()
    let nilai = ""
    for(let i = 1; i <= n; i++ ) {
      nilai = nilai + nilaiS
    }
    return `${nilai}`
  } else {
    return ``; 
  }
}




// Sample Test :
const chai = require("chai");
const assert = chai.assert;
chai.config.truncateThreshold=0;

describe("Tests", function() {
  it ("Basic tests", function() {
    assert.strictEqual(repeatStr(3, "*"), "***");
    assert.strictEqual(repeatStr(5, "#"), "#####");
    assert.strictEqual(repeatStr(2, "ha "), "ha ha ");
    assert.strictEqual(repeatStr(0, ""), "");
    assert.strictEqual(repeatStr(0, "I"), "");
    assert.strictEqual(repeatStr(5, ""), "");
    assert.strictEqual(repeatStr(6, "I"), "IIIIII");
    assert.strictEqual(repeatStr(5, "Hello"), "HelloHelloHelloHelloHello");
  });
});