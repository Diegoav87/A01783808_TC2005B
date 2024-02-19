function primeraMayuscula(text) {
    const splittedText = text.split(" ");
    const upperText = splittedText.map(word => word[0].toUpperCase() + word.slice(1));
    return upperText.join(" ");
}

const text = "hola buenas tardes";
const newText = primeraMayuscula(text);
console.log(newText);