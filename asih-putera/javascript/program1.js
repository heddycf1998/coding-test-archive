const kalkulator = () => {
    const prompt = require('prompt-sync')();
    let inputA = Number(prompt("Masukkan Angka : "));
    let operator = prompt("Masukkan Operator : ");
    let inputB = Number(prompt("Masukkan Angka : "));
    let hasil = 0;

    const operators = ["+", "-", "/", "*"]

    if (isNaN(inputA) || isNaN(inputB)) {
        console.log("Anda salah memasukkan input selain Angka")
    } else if (!operators.includes(operator)) {
        console.log("Hanya Boleh Operator Saja (" + operators.join(", ") + ")" )
    } else {
        operators.forEach(item => {
            if (item === "/" && inputB === 0) {
                hasil = "Tidak bisa dibagi dengan 0"
            } else if (operator === item) {
                hasil = eval(inputA + item + inputB)
            }
        });

        console.log(inputA + operator + inputB + " = " + hasil)
    }
}

kalkulator();