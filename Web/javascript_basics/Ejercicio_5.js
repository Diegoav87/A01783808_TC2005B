function maximoComunDivisor(a, b) {
    if (b === 0) {
        return a;
    } else {
        return maximoComunDivisor(b, a % b)
    }
}

const num1 = 26;
const num2 = 39;
const result = maximoComunDivisor(num1, num2);
console.log(result);

const num3 = 1432;
const num4 = 764;
const result2 = maximoComunDivisor(num3, num4);
console.log(result2);


const num5 = 50;
const num6 = 100;
const result3 = maximoComunDivisor(num5, num6);
console.log(result3);



