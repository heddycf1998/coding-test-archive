function isIsogram(str){
  const text = str.toLowerCase().split("")
  for(let i = 0; i < text.length; i++) {
    for(let j = i + 1; j < text.length; j++) {
        if (text[i] === text[j]) {
        return false
      }
    }  
  }
  return true
}




// Sample Test :
import { assert, config } from "chai"; 
config.truncateThreshold = 0;

// ... (Paste fungsi isIsogram kamu di sini) ...

describe("isIsogram", function() {
  // Fungsi helper tester ditaruh di dalam describe agar bisa diakses
  const tester = (input, expected) => {
    assert.strictEqual(isIsogram(input), expected, `Failed for input: "${input}"\n`);
  };

  it("Sample tests", function() {
    tester("Dermatoglyphics", true );
    tester("isogram", true );
    tester("aba", false);
    tester("moOse", false);
    tester("isIsogram", false );
    tester("", true);
  });
});