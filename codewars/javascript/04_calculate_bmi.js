// Write function bmi that calculates body mass index (bmi = weight / height2).
// if bmi <= 18.5 return "Underweight"
// if bmi <= 25.0 return "Normal"
// if bmi <= 30.0 return "Overweight"
// if bmi > 30 return "Obese"

function bmi(weight, height) {
  const index = weight / (height * height)
  if (index <= 18.5) {
    return "Underweight"
  } else if (index <= 25.0) {
    return "Normal"
  } else if (index <= 30.0) {
    return "Overweight"
  } else {
    return "Obese";  
  }
  
}





// Sample Test :
const { assert } = require('chai');

describe("BMI tests", () => {
  it("Sample tests", () => {
    assert.strictEqual(bmi(50, 1.80), "Underweight", "For weight = 50 and height = 1.80");
    assert.strictEqual(bmi(80, 1.80), "Normal", "For weight = 80 and height = 1.80");
    assert.strictEqual(bmi(90, 1.80), "Overweight", "For weight = 90 and height = 1.80");
    assert.strictEqual(bmi(100, 1.80), "Obese", "For weight = 100 and height = 1.80");
  });
});
