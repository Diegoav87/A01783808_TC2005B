function esPalindromo(s) {
    const stack = [];

    for (let i = 0; i < s.length; i++) {
        stack.push(s[i]);
    }

    for (let i = 0; i < s.length; i++) {
        const el = stack.pop();

        if (el != s[i]) {
            return false;
        }
    }

    return true;
}

const palindrome = "level";
const result = esPalindromo(palindrome);
console.log(result);

const palindrome2 = "abracadabra";
const result2 = esPalindromo(palindrome2);
console.log(result2);

const palindrome3 = "noon";
const result3 = esPalindromo(palindrome3);
console.log(result3);