function primerCaracterSinRepetir(text) {
    if (text == "") {
        return "";
    }

    let chars = {};

    for (let i = 0; i < text.length; i++) {
        if (text[i] in chars) {
            chars[text[i]] += 1;
        } else {
            chars[text[i]] = 1;
        }
    }

    for (let i = 0; i < text.length; i++) {
        if (chars[text[i]] == 1) {
            return text[i];
        }
    }


}

const text = "abacddbec";
const result = primerCaracterSinRepetir(text);
console.log(result);

const text2 = "jjklklkass";
const result2 = primerCaracterSinRepetir(text2);
console.log(result2);

const text3 = "hlfg";
const result3 = primerCaracterSinRepetir(text3);
console.log(result3);