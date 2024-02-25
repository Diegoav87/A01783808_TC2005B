function factorizar(num) {
    const factors = [1];

    for (let i = 2; i <= num; i++) {
        if (num % i === 0) {
            factors.push(i);
        }
    }

    return factors;
}

const num = 12;
const result = factorizar(num);
console.log(result);

const num2 = 45;
const result2 = factorizar(num2);
console.log(result2);

const num3 = 13;
const result3 = factorizar(num3);
console.log(result3);