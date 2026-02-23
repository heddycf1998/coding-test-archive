// Take 2 strings s1 and s2 including only letters from a to z. Return a new sorted string (alphabetical ascending), the longest possible, containing distinct letters - each taken only once - coming from s1 or s2.
// Examples:
// a = "xyaabbbccccdefww"
// b = "xxxxyyyyabklmopq"
// longest(a, b) -> "abcdefklmopqwxy"
// a = "abcdefghijklmnopqrstuvwxyz"
// longest(a, a) -> "abcdefghijklmnopqrstuvwxyz"

function longest(s1, s2) {
    const toArray = (ubah) => {
        return ubah.split('')
    }

    const urutkan = (huruf) => {
        for (let i = 0; i < huruf.length; i++) {
            for (let j = i + 1; j < huruf.length; j++) {
                if (huruf[j] < huruf[i]) {
                    let temp = huruf[j]
                    huruf[j] = huruf[i]
                    huruf[i] = temp
                }  
            }
        }
        return huruf
    }

    const hapus = (array) => {
        for (let i = 0; i < array.length; i++) {
            for (let j = 0; j < array.length; j++) {
                if (array[i] === array[i + 1]) {
                    array.splice(i, 1)
                }
            }
        }
        return array.join('')
    }
    
    const convertS1 = toArray(s1)
    const convertS2 = toArray(s2)

    const gabungan = [...convertS1, ...convertS2]

    const mengurutkan = urutkan(gabungan)
    const hasil = hapus(mengurutkan)

    return hasil
}




// Sample Test :
import { assert } from "chai";

describe("longest", () => {
    it("Basic tests",() => {
        assert.strictEqual(longest("aretheyhere", "yestheyarehere"), "aehrsty")
        assert.strictEqual(longest("loopingisfunbutdangerous", "lessdangerousthancoding"), "abcdefghilnoprstu")
        assert.strictEqual(longest("inmanylanguages", "theresapairoffunctions"), "acefghilmnoprstuy")
    })
})