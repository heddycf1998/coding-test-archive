const accounting = () => {
    const angka = 123456789.12
    const teksAngka = angka.toString()
    let bulat = ""
    let desimal = ""

    if (teksAngka.includes(".")) {
        let part = teksAngka.split(".")
        bulat = part[0]
        desimal = part[1]
    } else {
        bulat = teksAngka
    }

    let hasil = ""
    let counter = 0

    for (let i = bulat.length - 1; i >= 0; i--) {
        hasil = bulat[i] + hasil
        counter++

        if (counter % 3 === 0 && i !== 0) {
            hasil = "." + hasil
        }
    }

    if (!desimal) {
        console.log("Rp. " + hasil)
    } else if (desimal) {
        console.log("Rp. " + hasil + "," + desimal)
    }
    
}

accounting()