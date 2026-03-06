// A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).
// Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.

function isPangram(string){
    // Cara Manual
    const text = string.toLowerCase()
    const alphabet = 'abcdefghijklmnopqrstuvwxyz'

    for (let i = 0; i < alphabet.length; i++) {
        if (!text.includes(alphabet[i])) {
            return false
        }
    }

    return true

    // Cara bagus
    // const text = string.toLowerCase().replace(/[^a-z]/g, "")

    // const letter = new Set(text)

    // return letter.size === 26
}




// Sample Test :
import { assert } from "chai";


describe("isPangram", function() {
    it("Sample Tests", function() {
        tester("The quick brown fox jumps over the lazy dog.", true);
        tester("This is not a pangram.", false);
        tester("abcdefghijklmnopqrstuvwxy .", false);
    });

    function tester(string, expected) {
        assert.strictEqual(isPangram(string), expected, `Failed for input: ${JSON.stringify(string)}\n\n`);
    }
});