function quitarDuplicados(arr) {
    const dict = {}
    const newArr = [];

    for (let i = 0; i < arr.length; i++) {
        if (!(arr[i] in dict)) {
            dict[arr[i]] = 1;
            newArr.push(arr[i])
        }
    }

    return newArr;
}

const arr = [0, 1, 1, 0, 0, 1];
const result = quitarDuplicados(arr);
console.log(result);

const arr2 = [4, 7, 1, 6, 1, 4, 6, 8];
const result2 = quitarDuplicados(arr2);
console.log(result2);

const arr3 = [-5, -7, -7, 8, 8];
const result3 = quitarDuplicados(arr3);
console.log(result3);