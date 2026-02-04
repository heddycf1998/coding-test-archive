// angka terbesar : ['2', '7', '5', '9', '1']
const angkaTerbesar = () => {
    const angka = ['2', '7', '5', '9', '1']
    let realAngka = [];

    for (let i = 0; i < angka.length; i++) {
        realAngka.push(Number(angka[i]))
    }

    console.log(realAngka)

    for (let i = 0; i < realAngka.length; i++) {
        for (let j = 0; j < realAngka.length; j++) {
            if (realAngka[j] > realAngka[j+1]) {
                    let empty = realAngka[j]
                    realAngka[j] = realAngka[j+1]
                    realAngka[j+1] = empty
            }
            
        }
        
    }

    let besar = realAngka[realAngka.length - 1]

    console.log(`Angka Terbesar : ${besar}`)
    // console.log(`Tipe Data : ${typeof besar}`)
}

angkaTerbesar()