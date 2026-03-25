// You are going to be given a non-empty string. Your job is to return the middle character(s) of the string.

// If the string's length is odd, return the middle character.
// If the string's length is even, return the middle 2 characters.
// Examples:
// "test" --> "es"
// "testing" --> "t"
// "middle" --> "dd"
// "A" --> "A"

function getMiddle(s) {
    let tengah = Math.floor(s.length / 2)
    if (s.length % 2 === 0) {
      return s.substring(tengah-1, tengah+1)
    } else {
      return s.substring(tengah+1, tengah)
    }
}



// Sample Test :
import { assert } from "chai";
describe("GetMiddle", function() {

    function doTest(input, expected) {
        const message = `for input ${JSON.stringify(input)}\n`;
        const actual = getMiddle(input);
        assert.strictEqual(actual, expected, message);
    }

    it("Sample Tests", function() {
        doTest("test", "es");
        doTest("testing", "t");
        doTest("middle", "dd");
        doTest("A", "A");
    });
});