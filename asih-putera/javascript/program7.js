const bilanganPrima = () => {
    const prompt = require('prompt-sync')();

    let inputA = Number(prompt("Masukkan Angka : "))
    let hasil = []

    if (inputA > 1) {
        for (let i = 2; i <= inputA; i++) {
            if (inputA % i === 0) {
                hasil.push(i)
            }
        }
        
        console.log(hasil)

        if (hasil.length === 1) {
            console.log("Bilangan Prima")
            console.log(`Hanya dibagi oleh 1, ${hasil}`)
        } else {
            console.log("Bukan Bilangan Prima")
            console.log(`Bisa dibagi oleh 1, ${hasil.join(", ")}`)
        }
    } else {
        console.log(`${inputA} Bukan Bilangan Prima`)
    }
}

bilanganPrima()