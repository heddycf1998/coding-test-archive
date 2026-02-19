// Create a function which answers the question "Are you playing banjo?".
// If your name starts with the letter "R" or lower case "r", you are playing banjo!
// The function takes a name as its only argument, and returns one of the following strings:
// name + " plays banjo" 
// name + " does not play banjo"
// Names given are always valid strings.

function areYouPlayingBanjo(name) {
  let lowerName = name.toLowerCase()
  if (lowerName[0] === 'r') {
    return `${name} plays banjo`
  } else {
    return `${name} does not play banjo`;
  }
}




// Sample Test :
import { assert } from "chai";

describe("Basic tests", () => {
  it("Testing for fixed tests", () => {
    assert.strictEqual(areYouPlayingBanjo("Adam"), "Adam does not play banjo");
    assert.strictEqual(areYouPlayingBanjo("Paul"), "Paul does not play banjo");
    assert.strictEqual(areYouPlayingBanjo("Ringo"), "Ringo plays banjo");
    assert.strictEqual(areYouPlayingBanjo("bravo"), "bravo does not play banjo");
    assert.strictEqual(areYouPlayingBanjo("rolf"), "rolf plays banjo");
    })
  it("Testing with R in front of Text", () => {
    assert.strictEqual(areYouPlayingBanjo("Rara"), "Rara plays banjo")
    assert.strictEqual(areYouPlayingBanjo("rora"), "rora plays banjo")
    assert.strictEqual(areYouPlayingBanjo("Razor"), "Razor plays banjo")
    assert.strictEqual(areYouPlayingBanjo("rere"), "rere plays banjo")
  })
  it("Testing with no R in front of Text", () => {
    assert.strictEqual(areYouPlayingBanjo("123"), "123 does not play banjo")
    assert.strictEqual(areYouPlayingBanjo("1r8i"), "1r8i does not play banjo")
    assert.strictEqual(areYouPlayingBanjo("Lo8rio9R"), "Lo8rio9R does not play banjo")
  })
})