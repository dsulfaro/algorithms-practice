(function () {
if(typeof Algorithms === "undefined") {
  window.Algorithms = {};
}

// Write a method, digital_root(num).
// It should sum the digits of a positive integer.
// If it is greater than or equal to 10, sum the digits of the resulting number.
// Keep repeating until there is only one digit in the result, called the "digital root".
// Do not use string conversion within your method.
Algorithms.digitalRoot = function (number) {
  return number % 9;
};

// Write a function that takes a message and an increment amount and outputs the same letters shifted by that amount in the alphabet.
// Assume lowercase and no punctuation.
// Preserve spaces.
Algorithms.caesarCipher = function (string, shift) {
  let result = "";
  for (let i = 0; i < string.length; ++i) {
    let a = 'a'.charCodeAt(0);
    let x = string.charCodeAt(i) - a;
    x += shift;
    x = x % 26;
    x += a;
    result += String.fromCharCode(x);
  }
  return result;
};

Algorithms.getSubstrings = str => {
  let substrings = [];
  for (let i = 0; i < str.length; ++i) {
    let sub = "";
    for (let j = i; j < str.length; ++j) {
      sub += str[j];
      substrings.push(sub);
    }
  }
  return substrings;
}

// Write a function that takes two strings and returns the lenght of the longest common substring.
Algorithms.commonSubstrings = function (stringOne, stringTwo) {
  let sub1 = this.getSubstrings(stringOne);
  let sub2 = this.getSubstrings(stringTwo);
  let max = 0;
  for (let i = 0; i < sub1.length; ++i) {
    if (sub2.includes(sub1[i])) {
      if (sub1[i].length > max) {
        max = sub1[i].length;
      }
    }
  }
  return max;
};

// Write a function that takes an array of integers and returns their sum.
// Use recursion.
Algorithms.sumRec = function (numbers) {
  if (numbers.length === 1) {
    return numbers[0];
  }
  else {
    return numbers.pop() + this.sumRec(numbers);
  }
};

// Write a function which returns the first n elements from the fibonnacci sequence, given n.
Algorithms.fibs = function (number) {
  if (number === 1) {
    return [0];
  }
  else if (number === 2) {
    return [0, 1];
  }
  else {
    let previous_fibs = this.fibs(number - 1);
    let next_fib = previous_fibs[previous_fibs.length - 1] + previous_fibs[previous_fibs.length - 2]
    return previous_fibs.concat(next_fib);
  }
};

// Write a function that takes a string and returns true if it's a palindrome, false if it's not.
// Your solution should take less time and memory than rebuilding the string backward and comparing the two.
Algorithms.isPalindrome = function (string) {
  let i = 0;
  let j = string.length - 1;
  while (i !== j && i < j) {
    if (string[i] !== string[j]) {
      return false;
    }
    i++;
    j--;
  }
  return true;
};

// Implement the Folding Cipher.
// It folds the alphabet in half and uses the adjacent letter.
// a <=> z, b <=> y, c <=> x, m <=> n.
Algorithms.foldingCipher = function (string) {
  let a = 'a'.charCodeAt(0);
  let result = "";
  for (let i = 0; i < string.length; ++i) {
    let charCode = string.charCodeAt(i);
    result += String.fromCharCode(charCode + 25 - (2 * (charCode - a)));
  }
  return result;
};

// Write a method that finds all the unique substrings for a word.
Algorithms.uniqSubs = function (string) {
  let unique = new Set();
  let result = [];
  let subs = this.getSubstrings(string);
  subs.forEach(sub => {
    if (!unique.has(sub)) {
      unique.add(sub);
      result.push(sub);
    }
  });
  return result;
};


// Given an array of integers (positive and negative) find the largest contiguous subsum (sum of a subarray).
// You can solve this trivially in O(n**2) time by considering all subarrays.
// Try to solve it in O(n) time with O(1) memory.
Algorithms.lcs = function (array) {
  let max = array[0];
  let current = 0;
  for (let i = 0; i < array.length; ++i) {
    current += array[i];
    if (current > max) {
      max = current;
    }
    if (current < 0) {
      current = 0;
    }
  }
  return max;
};

// Write a function that takes a year (four digit integer) and returns an array with the 10 closest subsequent years that meet the following condition:
// the first two digits summed with the last two digits are equal to the middle two digits.
Algorithms.sillyYears = function (number) {
  let result = [];
  while (result.length !== 10) {
    number++;
    let string_year = number.toString();
    let first = parseInt(string_year[0] + string_year[1]);
    let middle = parseInt(string_year[1] + string_year[2]);
    let last = parseInt(string_year[2] + string_year[3]);
    if (first + last === middle) {
      result.push(number);
    }
  }
  return result;
};

// Given an array of integers, return all pairs that sum up to a specified value k.
// List the pairs in [min, max] order.
// Time complexity: O(n).
// Return an array.
Algorithms.pairSum = function (array, k) {
  let set = new Set();
  let result = new Set();
  array.forEach(x => {
    if (set.has(k - x)) {
      result.add([x, (k - x)])
      set.delete(k - x);
    }
    set.add(x);
  });
  return Array.from(result);
};

// Given a matrix of integers and coordinates of a rectangular region within the matrix.
// Find the sum of numbers falling inside the rectangle.
// Time complexity: O(number of rows * number of columns).
Algorithms.matrixRegionSum = function (matrix, topLeftCoords, bottomRightCoords) {
  let total = 0;
  let i = topLeftCoords[0];
  while (i <= bottomRightCoords[0]) {
    j = topLeftCoords[1];
    while (j <= bottomRightCoords[1]) {
      total += matrix[i][j];
      j++;
    }
    i++;
  }
  return total;
};

Algorithms.merge = function (left, right) {
  let result = [];
  while (left.length > 0 && right.length > 0) {
    if (left[0] > right[0]) {
      result.push(right.shift());
    }
    else {
      result.push(left.shift());
    }
  }
  result = result.concat(left.concat(right));
  return result;
};

Algorithms.merge_sort = array => {
  if (array.length <= 1) {
    return array;
  }
  let middle = array.length / 2;
  let left = array.slice(0, middle);
  let right = array.slice(middle);
  return Algorithms.merge(Algorithms.merge_sort(left), Algorithms.merge_sort(right));
};

Algorithms.binary_search = (array, target) => {


  if (array.length < 1) { return null; }

  if (array.length === 1) {
    if (array[0] === target) { return 0; }
    else { return null; }
  }

  let mid = array.length / 2;
  alert(array[mid]);
  alert(target);
  if (array[mid] === target) {
    return mid;
  }
  else if (array[mid] < target) {
    let val = Algorithms.binary_search(array.slice(mid + 1), target);
    if (val !== null) {
      return mid + val;
    }
    else {
      return null;
    }
  }
  else {
    return Algorithms.binary_search(array.slice(0, mid), target);
  }
};


})();
