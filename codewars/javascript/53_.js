function longestConsec(strarr, k) {
    let arr = []
    for (let i = 0; i < strarr.length; i++) {
        if (typeof strarr[i + 1] !== 'undefined') {
            arr.push( strarr[i] + strarr[i + 1])
        }
        
    }
    console.log(arr)
}


longestConsec(["zone", "abigail", "theta", "form", "libe", "zas"], 2)