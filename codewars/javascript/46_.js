function findEvenIndex(arr) {
  let sumLeft = 0
  let sumRight = 0
  let temp = 0
  for (let i = 0; i < arr.length; i++) {
    console.log(i)
    if (arr[i-1] === NaN) {
      arr[i-1] = 0
    }
    sumLeft = sumLeft + arr[i - 1]
    let arrLeft = arr.slice(i-1, i-1)
    console.log(arrLeft)
    let arrRight = arr.slice(i+1, arr.length)
    console.log(arrRight)
    sumRight = arrRight.reduce((total, nilai) => total + nilai, 0)
    console.log(sumRight)
    if (sumLeft === sumRight) {
      temp = arr[i]
    }
  }
  console.log(temp)
}


findEvenIndex([1,2,3,4,3,2,1])