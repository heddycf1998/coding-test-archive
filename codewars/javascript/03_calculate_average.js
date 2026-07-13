// Write a function which calculates the average of the numbers in a given array.

function findAverage(array) {
  if (array.length === 0) {
    return 0;  
  } else {
    const jumlahTotal = array.reduce((akumulator, nilaiSaatIni) => akumulator + nilaiSaatIni, 0)
    const rata_rata = jumlahTotal / array.length
    return rata_rata
  }
}




// Sample Test :
const { assert, config } = require("chai");
config.truncateThreshold = 0;

describe("findAverage", () => {
  it("Testing for sample tests", () => {
    tester([1,1,1], 1);
    tester([1,2,3], 2);
    tester([1,2,3,4], 2.5);
  });
  
  const tester = (input, expected) => {
    const tolerance = 1e-10;
    const err_msg = `Failed for input: ${JSON.stringify(input)}\n`;
    const actual = findAverage(input);
    assert.approximately(actual, expected, tolerance, err_msg);
  }
});  
