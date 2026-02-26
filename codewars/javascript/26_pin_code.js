// ATM machines allow 4 or 6 digit PIN codes and PIN codes cannot contain anything but exactly 4 digits or exactly 6 digits.
// If the function is passed a valid PIN string, return true, else return false.
// Examples (Input --> Output)
// "1234"   -->  true
// "12345"  -->  false
// "a234"   -->  false


function validatePIN (pin) {
   if (pin.length !== 4 && pin.length !== 6) {
      return false
   }

   for (let i = 0; i < pin.length; i++) {
      if (pin[i] < '0' || pin[i] > '9') {
         return false
      }
   }

   return true
}





// Sample Test : 
import { assert } from "chai";
describe("validatePIN", function() {
  it("should return False for pins with length other than 4 or 6", function() {
    assert.strictEqual(validatePIN("1"),false, "Wrong output for '1'")
    assert.strictEqual(validatePIN("12"),false, "Wrong output for '12'")
    assert.strictEqual(validatePIN("123"),false, "Wrong output for '123'")
    assert.strictEqual(validatePIN("12345"),false, "Wrong output for '12345'")
    assert.strictEqual(validatePIN("1234567"),false, "Wrong output for '1234567'")
    assert.strictEqual(validatePIN("-1234"),false, "Wrong output for '-1234'")
    assert.strictEqual(validatePIN("1.234"),false, "Wrong output for '1.234'")
    assert.strictEqual(validatePIN("-1.234"),false, "Wrong output for '-1.234'")
    assert.strictEqual(validatePIN("00000000"),false, "Wrong output for '00000000'")
  });
  
  it("should return False for pins which contain characters other than digits", function() {
    assert.strictEqual(validatePIN("a234"),false, "Wrong output for 'a234'")
    assert.strictEqual(validatePIN(".234"),false, "Wrong output for '.234'")
  });
  
  it("should return True for valid pins", function() {
    assert.strictEqual(validatePIN("1234"),true, "Wrong output for '1234'");
    assert.strictEqual(validatePIN("0000"),true, "Wrong output for '0000'");
    assert.strictEqual(validatePIN("1111"),true, "Wrong output for '1111'");
    assert.strictEqual(validatePIN("123456"),true, "Wrong output for '123456'");
    assert.strictEqual(validatePIN("098765"),true, "Wrong output for '098765'");
    assert.strictEqual(validatePIN("000000"),true, "Wrong output for '000000'");
    assert.strictEqual(validatePIN("123456"),true, "Wrong output for '123456'");
    assert.strictEqual(validatePIN("090909"),true, "Wrong output for '090909'");
  });
});