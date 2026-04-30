// Sebenarnya test nya tuh coding tulis tangan dan gak boleh liat ke HP / Internet / Laptop (Tanpa alat bantu)
// Jadi nulis codingannya di kertas polio bergaris dan dikasih kertas coretan

function calculatePoint(membershipType, amount) {
    let point = 0
    let totalPoint = 0
    let min = 1000000
    let kelipatan = 100000

    if (membershipType === "Bronze") { 
        if (amount >= min) {
            point = 10
            totalPoint = totalPoint + point
        }
    }
    if (membershipType === "Silver") { 
        if (amount >= min) {
            point = 15
            if ((amount - min) >= kelipatan) {
                totalPoint = ( ( (amount - min) - ((amount - min) % kelipatan) ) / kelipatan ) * 2
            }
            totalPoint = totalPoint + point
        }
    }
    if (membershipType === "Gold") { 
        if (amount >= min) {
            point = 20
            if ((amount - min) >= kelipatan) {
                totalPoint = ( ( (amount - min) - ((amount - min) % kelipatan) ) / kelipatan ) * 2
            }
            totalPoint = totalPoint + point
        }
    }
    return totalPoint
}


// console.log(calculatePoint("Bronze", 1000000))
// console.log(calculatePoint("Bronze", 1100000))
// console.log(calculatePoint("Bronze", 1200000))
// console.log(calculatePoint("Bronze", 2000000))
// console.log('--- --- ---')
// console.log(calculatePoint("Silver", 1000000))
// console.log(calculatePoint("Silver", 1100000))
// console.log(calculatePoint("Silver", 1200000))
// console.log(calculatePoint("Silver", 2000000))
// console.log('--- --- ---')
// console.log(calculatePoint("Gold", 1000000))
// console.log(calculatePoint("Gold", 1100000))
// console.log(calculatePoint("Gold", 1200000))
// console.log(calculatePoint("Gold", 2000000))
// console.log('--- --- ---')


// Sample Test :
import { assert } from "chai";

describe("Tests", () => {
  it("test", () => {
    assert.strictEqual(calculatePoint("Bronze", 1000000),  10)
    assert.strictEqual(calculatePoint("Bronze", 1100000),  10)
    assert.strictEqual(calculatePoint("Bronze", 1200000),  10)
    assert.strictEqual(calculatePoint("Bronze", 2000000),  10)

    assert.strictEqual(calculatePoint("Silver", 1000000),  15)
    assert.strictEqual(calculatePoint("Silver", 1100000),  17)
    assert.strictEqual(calculatePoint("Silver", 1200000),  19)
    assert.strictEqual(calculatePoint("Silver", 2000000),  35)

    assert.strictEqual(calculatePoint("Gold", 1000000),  20)
    assert.strictEqual(calculatePoint("Gold", 1100000),  22)
    assert.strictEqual(calculatePoint("Gold", 1200000),  24)
    assert.strictEqual(calculatePoint("Gold", 2000000),  40)
  });
});
