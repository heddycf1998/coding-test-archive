const ganjilGenap = () => {
    const prompt = require('prompt-sync')();

    let inputA = Number(prompt("Masukkan Angka : "));

    if (inputA % 2 === 0) {
        console.log(inputA + ' adalah Genap')
    } else if (inputA % 2 === 1) {
        console.log(inputA + ' adalah Ganjil')
    } else {
        console.log('Bukan Angka')
    }
}

ganjilGenap()