function invertirNuevoArreglo(arr) {
    const newArr = [];

    for (let i = arr.length - 1; i >= 0; i--) {
        newArr.push(arr[i]);
    }

    return newArr;
}

const arr = [1, 2, 3, 4, 5];
const result = invertirNuevoArreglo(arr);
console.log(result);

function invertirMismoArreglo(arr) {

    for (let i = 0; i < arr.length / 2; i++) {
        temp = arr[i];
        arr[i] = arr[arr.length - 1 - i];
        arr[arr.length - 1 - i] = temp;
    }

    return arr;
}

const arr2 = [1, 2, 3, 4, 5];
const result2 = invertirMismoArreglo(arr2);
console.log(result2);