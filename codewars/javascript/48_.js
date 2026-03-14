function duplicateCount(text){
    if (text === "") {
        console.log(0)
    }

    const alphabet = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz"
    for (let i = 0; i < text.length; i++) {
        
    }
    let count = 0
    for (let j = 0; j < alphabet.length; j++) {
        for (let i = 0; i < text.length; i++) {
            if (text[i].includes(alphabet[j])) {
                console.log(count++)
            }
        }
    }
}


duplicateCount("")
duplicateCount("abcde")
duplicateCount("aabbcde")
// duplicateCount("aabBcde")
// duplicateCount("Indivisibility")
// duplicateCount("Indivisibilities") 