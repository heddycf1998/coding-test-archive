// Simple, given a string of words, return the length of the shortest word(s).
// String will never be empty and you do not need to account for different data types.

function findShort(s){
  let word = s.split(' ')
  for (let i = 0; i < word.length; i++) {
    for (let j = i + 1; j < word.length; j++) {
        if (word[i].length >= word[j].length) {
            let empty = word[i]
            word[i] = word[j]
            word[j] = empty
        }
        
    }
  }
  return word[0].length
}




// Sample Test :
import { assert } from "chai";
describe("Basic tests", () => {
  it("Testing for fixed tests", () => {
    assert.strictEqual(findShort("bitcoin take over the world maybe who knows perhaps"), 3);
    assert.strictEqual(findShort("turns out random test cases are easier than writing out basic ones"), 3); 
    assert.strictEqual(findShort("Let's travel abroad shall we"), 2);
  })
})