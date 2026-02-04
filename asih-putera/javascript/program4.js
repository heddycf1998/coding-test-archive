const angkaGenap = () => {
    let hasil = []
    for (let i = 0; i <= 40; i++) {
        if (i % 2 === 0) {
            hasil.push(i)
        }
    }
    const angka = hasil.join(", ")
    console.log(angka)
}

angkaGenap()