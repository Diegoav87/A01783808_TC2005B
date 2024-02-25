function ordenAlfabetico(arr) {
    if (arr.length === 0) {
        return arr;
    }

    const sorted = [...arr]

    for (let i = 0; i < sorted.length; i++) {
        for (let j = i; j < sorted.length; j++) {


            if (sorted[i].localeCompare(sorted[j]) !== -1) {
                const temp = sorted[i];
                sorted[i] = sorted[j];
                sorted[j] = temp;
            }
        }
    }

    return sorted;
}

const arr = ["hola", "buenas", "tardes"];
const result = ordenAlfabetico(arr);
console.log(result);

const arr2 = ["hello", "how", "Are", "you"];
const result2 = ordenAlfabetico(arr2);
console.log(result2);

const arr3 = ["", "dog", "pig", "cat"];
const result3 = ordenAlfabetico(arr3);
console.log(result3);