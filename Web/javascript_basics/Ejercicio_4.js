function primeraMayuscula(text) {
    if (text === "") {
        return text;
    }

    const splittedText = text.split(" ");
    const upperText = splittedText.map(word => word[0].toUpperCase() + word.slice(1));
    return upperText.join(" ");
}

const text = "hola buenas tardes";
const result = primeraMayuscula(text);
console.log(result);

const text2 = "";
const result2 = primeraMayuscula(text2);
console.log(result2);

const text3 = "hola Como estas";
const result3 = primeraMayuscula(text3);
console.log(result3);