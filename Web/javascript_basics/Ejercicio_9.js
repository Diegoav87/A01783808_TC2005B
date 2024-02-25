function longitudCadenaMasCorta(arr) {
    let shortest = arr[0];

    for (let i = 0; i < arr.length; i++) {
        if (arr[i].length < shortest.length) {
            shortest = arr[i];
        }
    }

    return shortest;
}

const strings = ["hello", "hi", "how"]
const result = longitudCadenaMasCorta(strings);
console.log(result);

const strings2 = ["", "dog", "cat"]
const result2 = longitudCadenaMasCorta(strings2);
console.log(result2);

const strings3 = ["hello there", "sdfsdfdsf"]
const result3 = longitudCadenaMasCorta(strings3);
console.log(result3);