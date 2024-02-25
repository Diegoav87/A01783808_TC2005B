function cadenaMasFrecuente(arr) {
    const dict = {};

    for (let i = 0; i < arr.length; i++) {
        if (arr[i] in dict) {
            dict[arr[i]] += 1;
        } else {
            dict[arr[i]] = 1;
        }
    }

    let current = [arr[0], dict[arr[0]]];

    for (let i = 0; i < arr.length; i++) {
        if (dict[arr[i]] > current[1]) {
            current = [arr[i], dict[arr[i]]]
        }
    }

    return current[0];


}

const strings = ["hello", "how", "how", "hello", "are", "are", "you", "are"];
const results = cadenaMasFrecuente(strings);
console.log(results);

const strings2 = ["dog", "cat", "cat"];
const results2 = cadenaMasFrecuente(strings2);
console.log(results2);

const strings3 = ["", ""];
const results3 = cadenaMasFrecuente(strings3);
console.log(results3);