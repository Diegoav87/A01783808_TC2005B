function hackerSpeak(text) {
    if (text === "") {
        return text;
    }

    dict = {
        "a": "4",
        "s": "5",
        "i": "1",
        "e": "3",
        "o": "0"
    }

    const arr = text.split("");

    for (let i = 0; i < arr.length; i++) {
        if (arr[i] in dict) {
            arr[i] = dict[arr[i]];
        }
    }

    return arr.join("");
}

const text = "Javascript is cool";
const result = hackerSpeak(text);
console.log(result);

const text2 = "Hello how are you";
const result2 = hackerSpeak(text2);
console.log(result2);

const text3 = "My name is Diego";
const result3 = hackerSpeak(text3);
console.log(result3);