function medianaYModa(arr) {
    if (arr.length === 0) {
        return { median: null, mode: null };
    }

    arr.sort();

    const dict = {};
    let currentModeVal = 0;
    let modes = [];

    for (let i = 0; i < arr.length; i++) {
        const num = arr[i];
        if (dict[num]) {
            dict[num] += 1;
        } else {
            dict[num] = 1;
        }
        if (dict[num] > currentModeVal) {
            currentModeVal = dict[num];
        }
    }

    for (let num = 0; num < arr.length; num++) {
        if (dict[arr[num]] === currentModeVal && modes.indexOf(arr[num]) === -1) {
            modes.push(arr[num]);
        }
    }


    let median = 0;

    if (arr.length % 2 === 0) {
        median = (arr[arr.length / 2] + arr[arr.length / 2 - 1]) / 2;
    } else {
        median = arr[Math.floor(arr.length / 2)];
    }

    return { median: median, mode: modes };
}

const arr1 = [3, 2, 1, 4, 6, 5, 9, 7, 8];
const result1 = medianaYModa(arr1);
console.log(result1);

const arr2 = [5, 4, 1, 2, 1, 7, 4, 4, 8, 5, 9];
const result2 = medianaYModa(arr2);
console.log(result2);

const arr3 = [1, 3, 4, 5];
const result3 = medianaYModa(arr3);
console.log(result3);
