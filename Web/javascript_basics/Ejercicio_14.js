function potenciaDeDos(x) {
    if (x <= 0) {
        return false;
    }

    return Math.log2(x) === Math.trunc(Math.log2(x));
}

const num1 = 8;
const resultado = potenciaDeDos(num1);
console.log(resultado);

const num2 = 63;
const resultado2 = potenciaDeDos(num2);
console.log(resultado2);

const num3 = 2;
const resultado3 = potenciaDeDos(num3);
console.log(resultado3);