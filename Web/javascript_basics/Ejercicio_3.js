function invertirNuevoArreglo(arr) {
    const newArr = [];

    for (let i = arr.length - 1; i >= 0; i--) {
        newArr.push(arr[i]);
    }

    return newArr;
}

const arr = [1, 2, 3, 4, 5];
const newArr = invertirNuevoArreglo(arr);
console.log(newArr);

function invertirMismoArreglo(arr) {
    let j = 0;

    for (let i = arr.length - 1; i >= 0; i--) {
        temp = arr[i];
        arr[i] = arr[j]
        arr[j] = temp;
        j++;
    }

    return arr;
}

const arr2 = [1, 2, 3, 4, 5];
const newArr2 = invertirMismoArreglo(arr);
console.log(newArr2);