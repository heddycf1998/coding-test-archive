// Welcome.

// In this kata you are required to, given a string, replace every letter with its position in the alphabet.

// If anything in the text isn't a letter, ignore it and don't return it.

// "a" = 1, "b" = 2, etc.

// Example
// Input = "The sunset sets at twelve o' clock."
// Output = "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"


function alphabetPosition(text) {
    const teksBersih = text.replace(/[^a-zA-Z]/g, "").toLowerCase()
    let arr = []

    for (let i = 0; i < teksBersih.length; i++) {
        if ((teksBersih.charCodeAt(i) - 96) < 0) {
            arr.push(96 - teksBersih.charCodeAt(i))    
        } else {
            arr.push(teksBersih.charCodeAt(i) - 96)
        }
    }
   return arr.join(' ')
}




// Sample Test :
import { assert } from "chai"

describe("Tests", () => {
  it("test", () => {
    assert.strictEqual(alphabetPosition("The sunset sets at twelve o' clock."), "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11");
    assert.strictEqual(alphabetPosition("The narwhal bacons at midnight."), "20 8 5 14 1 18 23 8 1 12 2 1 3 15 14 19 1 20 13 9 4 14 9 7 8 20");
  });
});
