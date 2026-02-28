// Trolls are attacking your comment section!
// A common way to deal with this situation is to remove all of the vowels from the trolls' comments, neutralizing the threat.
// Your task is to write a function that takes a string and return a new string with all vowels removed.
// For example, the string "This website is for losers LOL!" would become "Ths wbst s fr lsrs LL!".
// Note: for this kata y isn't considered a vowel.

function disemvowel(str) {
    const vowel = ['A','a', 'I', 'i', 'U', 'u', 'E', 'e', 'O', 'o'];
    let newStr = str.split('');

    for (let i = 0; i < newStr.length; i++) {
        for (let j = 0; j < vowel.length; j++) {
            if (newStr[i] === vowel[j]) {
                delete newStr[i]
            }
        }
    }

    return newStr.join('')
}




// Sample Test :
import { assert } from "chai";

describe("Basic tests", () => {
  it("Testing for fixed tests", () => {
    assert.strictEqual(disemvowel("This website is for losers LOL!"), "Ths wbst s fr lsrs LL!")
    assert.strictEqual(disemvowel("No offense but,\nYour writing is among the worst I've ever read"), "N ffns bt,\nYr wrtng s mng th wrst 'v vr rd")
    assert.strictEqual(disemvowel("What are you, a communist?"), "Wht r y,  cmmnst?")
    })
  })