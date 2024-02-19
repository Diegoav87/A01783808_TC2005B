function cadenaDeTexto(text) {
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
const result = cadenaDeTexto(text);
console.log(result);