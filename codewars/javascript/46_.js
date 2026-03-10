function findEvenIndex(arr) {
  let sumLeft = 0
  let sumRight = 0
  let temp = 0
  for (let i = 0; i < arr.length; i++) {
    // console.log(i)
    if (arr[i-1] === arr[-1]) {
      arr[i-1] = 0
    }
    if (arr[i-1] === arr[i]) {
      arr[i] = arr[i]
    }
    sumLeft = sumLeft + arr[i - 1]
    // console.log(sumLeft)
    // let arrLeft = arr.slice(0, arr.length - i)
    // console.log(arrLeft)
    let arrRight = arr.slice(i+1, arr.length)
    // console.log(arrRight)
    sumRight = arrRight.reduce((total, nilai) => total + nilai, 0)
    // console.log(sumRight)
    if (sumLeft === sumRight) {
      temp = arr.indexOf(arr[i], i)
    }
    if (arr.indexOf(arr[i + 1]) > arr.length) {
      temp = -1
    }
  }
  console.log(temp)
}


findEvenIndex([1,2,3,4,3,2,1])
findEvenIndex([1,100,50,-51,1,1])
findEvenIndex([1,2,3,4,5,6])
findEvenIndex([20,10,30,10,10,15,35])
findEvenIndex([20,10,-80,10,10,15,35])
findEvenIndex([10,-80,10,10,15,35,20])
findEvenIndex([8,8])
findEvenIndex([8,0])
findEvenIndex([0,8])
findEvenIndex([7,3,-3])
findEvenIndex([8])
findEvenIndex([0,0,0,0,0])
findEvenIndex([-1,1,0,-1,1,0,-1,1,0,0])