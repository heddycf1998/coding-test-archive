// test nya pake hacker rank (.) com
let a = [18, 15, 29, 30]

function fizzBuzz(input) {
    let hasil = []
    for (let i = 0; i < a.length; i++) {  
        if (input[i] % 3 == 0 && input[i] % 5 == 0) {
            hasil.push("FizzBuzz") 
        } else if (input[i] % 3 == 0) {
            hasil.push("Fizz")
            }
            else if (input[i] % 5 == 0) {
                hasil.push("Buzz")
            } else {
                hasil.push("---")
            }
    }

    return hasil
}


console.log(fizzBuzz(a))