const faktorial = () => {
    const prompt = require('prompt-sync')();

    let inputA = Number(prompt("Masukkan Angka : "))
    let hasil = 1
    let simpan = []

    if (isNaN(inputA)) {
        console.log("Anda salah memasukkan input selain Angka")
    } else if (inputA < 0) {
        console.log("Tidak boleh angka Minus")
    } else if (inputA === 0) {
        console.log(`${inputA} Faktorial`)
        console.log(`${inputA}! : ${hasil} = ${hasil}`)
    } else {
        for (let i = inputA; i >= 1; i--){
            hasil = i * hasil
            simpan.push(i)
        }
        console.log(`${inputA} Faktorial`)
        console.log(`${inputA}! : ${simpan.join(" x ")} = ${hasil}`)
    }
}

faktorial()