// Write a function "greet" that returns "hello world!"
function greet() {
  return "hello world!"
}

import { assert } from "chai";

describe("Testing function", function() {
  it("Is it a function?", function() {
    assert.strictEqual(typeof greet, "function", "greet should be a function");
  });
  it("Correct return-value?", function() {
    assert.strictEqual(greet(), "hello world!");
  });
});