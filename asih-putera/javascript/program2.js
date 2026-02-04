const sortAscending = () => {
    const number = ['12', '5', '3', '20', '1']

    console.log("Sebelum :")
    console.log(number)

    let angka = []
    for (let i = 0; i < number.length; i++) {
        angka.push(Number(number[i]))
    }
    
    for (let i = 0; i < angka.length; i++) {
        for (let j = 0; j < angka.length; j++) {
            if (angka[j] > angka[j+1]) {
                let empty = angka[j]
                angka[j] = angka[j+1]
                angka[j+1] = empty
            }
        }
    }

    let angkaString = []
    for (let i = 0; i < angka.length; i++) {
        angkaString.push(String(angka[i]))
    }
    
    console.log("Sesudah : ")
    console.log(angkaString)
}

sortAscending()