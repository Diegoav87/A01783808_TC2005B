function bubbleSortDescendente(arr) {
    if (arr.length === 0) {
        return arr;
    }

    const sorted = [...arr]

    for (let i = 0; i < sorted.length; i++) {
        for (let j = i; j < sorted.length; j++) {
            if (sorted[i] < sorted[j]) {
                const temp = sorted[i];
                sorted[i] = sorted[j];
                sorted[j] = temp;
            }
        }
    }

    return sorted;
}

const array1 = [4, 1, 7, 0, 2, -3, 6, 0, -1];
const result1 = bubbleSortDescendente(array1);
console.log(result1);

const array2 = [1, 1, 0, 2, -1, -1];
const result2 = bubbleSortDescendente(array2);
console.log(result2);

const array3 = [-5, -9, -3, 68, 100, 1, 5];
const result3 = bubbleSortDescendente(array3);
console.log(result3);