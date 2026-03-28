// Messi goals function
// Messi is a soccer player with goals in three leagues:

// LaLiga
// Copa del Rey
// Champions
// Complete the function to return his total number of goals in all three leagues.

// Note: the input will always be valid.

// For example:

// 5, 10, 2  -->  17


function goals (laLigaGoals, serieA, SaudiProLeague) {
  return laLigaGoals + serieA + SaudiProLeague
}



// Sample Test :
import { assert } from "chai";

describe("Tests", () => {
  it("test", () => {
    assert.strictEqual(goals(0,0,0), 0)
    assert.strictEqual(goals(43, 10, 5), 58)
  });
});
