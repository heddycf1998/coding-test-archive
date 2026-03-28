function solution(str, ending){
  if (str.endsWith(ending)) {
    return true
  } else {
    return false
  }
}



// Sample Test :
import { assert } from "chai";

describe("solution", function() {
  it("Sample Tests", function() {
    tester('abcde', 'cde', true);
    tester('abcde', 'abc', false);
    tester('empty ending', '', true);
    tester('', 'empty string', false);
    tester('', '', true);
  });

  function tester(str, ending, expected) {
    const err_msg = `Failed for inputs:\n- str: "${str}"\n- ending: "${ending}"\n\n`;
    assert.strictEqual(solution(str, ending), expected, err_msg);
  };
});
