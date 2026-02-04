const mengandungAngka = () => {
    const prompt = require('prompt-sync')();

    let inputA = prompt("Masukkan Data : ").trim()
    let hasil = false

    for (let i = 0; i < inputA.length; i++) {
        if (inputA[i] !== " ") {
            if (Number(inputA[i]) || Number(inputA[i]) === 0) {
            hasil = true
            break
            }
        }
    }

    if (hasil) {
        console.log("TRUE")
        console.log("Data tersebut mengandung Angka")
    } else {
        console.log("FALSE")
        console.log("Data tersebut tidak mengandung Angka")
    }
}

mengandungAngka()