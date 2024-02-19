function bubbleSort(arr) {
    const sorted = [...arr]

    for (let i = 0; i < sorted.length; i++) {
        for (let j = i; j < sorted.length; j++) {
            if (sorted[i] > sorted[j]) {
                const temp = sorted[i];
                sorted[i] = sorted[j];
                sorted[j] = temp;
            }
        }
    }

    return sorted;
}

const array = [4, 1, 7, 0, 2, -3, 6, 0, -1];
const sorted = bubbleSort(array);
console.log(sorted);