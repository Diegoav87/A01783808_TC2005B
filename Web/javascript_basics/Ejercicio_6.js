function hackerSpeak(text) {
    dict = {
        "a": "4",
        "s": "5",
        "i": "1",
        "e": "3",
        "o": "0"
    }

    const arr = 

    for (let i = 0; i < text.length; i++) {
        if (text[i] in dict) {
            text[i] = dict[text[i]];
        }
    }

    return text;
}

const text = "Javascript";
const hackerText = hackerSpeak(text);
console.log(hackerText);