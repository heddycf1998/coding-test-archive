const number = [12, 5, 3, 20, 1]
console.log("sebelum : " + number)

const sortAscending = () => {
    for (let i = 0; i < number.length; i++) {
        for (let j = 0; j < number.length; j++) {
            if (number[j] > number[j+1]) {
                let empty = number[j]
                number[j] = number[j+1]
                number[j+1] = empty
            }
        }
}
console.log("sesudah : " + number)
}

sortAscending()