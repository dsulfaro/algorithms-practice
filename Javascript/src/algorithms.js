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
  return number % 9
};

// Write a function that takes a message and an increment amount and outputs the same letters shifted by that amount in the alphabet.
// Assume lowercase and no punctuation.
// Preserve spaces.
Algorithms.caesarCipher = function (string, shift) {
  result = ""
  for (let i = 0; i < string.length; ++i) {
    // console.log(String.fromCharCode((string.charCodeAt(i) + shift) % 26))
    if (string[i] !== " ") {
      result += (String.fromCharCode((string.charCodeAt(i) + (shift % 26))))
    }
    else {
      result += " "
    }
  }
  return result
};


Algorithms.getSubstrings = str => {
  let result = []
  let i, j
  for (i = 0; i < str.length; ++i) {
    for (j = i + 1; j <= str.length; ++j) {
      result.push(str.slice(i, j))
    }
  }
  return result
}

Algorithms.make_substring_matrix = function (str1, str2) {
  let matrix = new Array(str1.length + 1)
  let i, j
  for (i = 0; i <= str2.length; ++i) {
    matrix[i] = (new Array(str2.length + 1).fill(0))
  }
  for (i = 0; i < str1.length; ++i) {
    for (j = 0; j < str2.length; ++j) {
      if (str1[i] === str2[j]) {
        matrix[i + 1][j + 1] = matrix[i][j] + 1
      }
      else {
        matrix[i + 1][j + 1] = 0
      }
    }
  }
  return matrix
}

// Write a function that takes two strings and returns the lenght of the longest common substring.
Algorithms.longestCommonSubstrings = function (stringOne, stringTwo) {
  let matrix = Algorithms.make_substring_matrix(stringOne, stringTwo)
  let greatest = ""
  matrix.forEach((row, i) => {
    row.forEach((el, j) => {
      if (el > greatest.length) {
        greatest = stringTwo.slice((j - el), j)
      }
    })
  });
  return greatest.length
};

// Write a function that takes an array of integers and returns their sum.
// Use recursion.
Algorithms.sumRec = function (numbers) {
  if (numbers.length === 1) { return numbers[0] }
  return numbers[0] + Algorithms.sumRec(numbers.slice(1))
};

// Write a function which returns the first n elements from the fibonnacci sequence, given n.
Algorithms.fibs = function (number) {
  if (number === 1) { return [0] }
  if (number === 2) { return [0, 1] }
  let prev_fibs = Algorithms.fibs(number - 1)
  let len = prev_fibs.length
  let new_fib = prev_fibs[len - 1] + prev_fibs[len - 2]
  prev_fibs.push(new_fib)
  return prev_fibs
};

// Write a function that takes a string and returns true if it's a palindrome, false if it's not.
// Your solution should take less time and memory than rebuilding the string backward and comparing the two.
Algorithms.isPalindrome = function (string) {
  if (string.length <= 1) { return true }
  if (string[0] !== string[string.length - 1]) { return false }
  return Algorithms.isPalindrome(string.slice(1, string.length - 1))
};

// Implement the Folding Cipher.
// It folds the alphabet in half and uses the adjacent letter.
// a <=> z, b <=> y, c <=> x, m <=> n.
Algorithms.foldingCipher = function (string) {
  let alphabet = "abcdefghijklmnopqrstuvwxyz".split("")
  let result = ""
  let i, char, idx, new_index
  let a = 'a'.charCodeAt(0)
  for (i = 0; i < string.length; ++i) {
    char = alphabet.indexOf(string[i])
    idx = alphabet.indexOf(string[i])
    new_index = ((idx + 25) - (idx * 2))
    result += String.fromCharCode(new_index + a)
  }
  return result
};

// Write a method that finds all the unique substrings for a word.
Algorithms.uniqSubs = function (string) {
  let result = new Set()
  let i, j
  let sub = ""
  for (i = 0; i < string.length; ++i) {
    for (j = i + 1; j <= string.length; ++j) {
      sub = string.slice(i, j)
      result.add(sub)
    }
  }
  return Array.from(result)
};


// Given an array of integers (positive and negative) find the largest contiguous subsum (sum of a subarray).
// You can solve this trivially in O(n**2) time by considering all subarrays.
// Try to solve it in O(n) time with O(1) memory.
Algorithms.lcs = function (array) {
  let max = 0
  let curr = 0
  array.forEach(el => {
    curr += el
    if (curr > max) { max = curr }
    if (curr < 0) { curr = 0}
  })
  return max
};

// Write a function that takes a year (four digit integer) and returns an array with the 10 closest subsequent years that meet the following condition:
// the first two digits summed with the last two digits are equal to the middle two digits.
Algorithms.sillyYears = function (number) {
  let result = []
  let year
  while (result.length != 10) {
    number += 1
    year = number.toString()
    if (parseInt(year.slice(0, 2)) + parseInt(year.slice(2, 4)) == parseInt(year.slice(1, 3))) { result.push(number) }
  }
  return result
};

// Given an array of integers, return all pairs that sum up to a specified value k.
// List the pairs in [min, max] order.
// Time complexity: O(n).
// Return an array.
Algorithms.pairSum = function (array, k) {
  let set = new Set()
  let result = []
  array.forEach(el => {
    if (set.has(k - el)) {
      result.push([el, k - el])
      set.delete(k - el)
    }
    set.add(el)
  })
  return result
};

// Given a matrix of integers and coordinates of a rectangular region within the matrix.
// Find the sum of numbers falling inside the rectangle.
// Time complexity: O(number of rows * number of columns).
Algorithms.matrixRegionSum = function (matrix, topLeftCoords, bottomRightCoords) {
  let total = 0
  let i, j
  for (i = topLeftCoords[0]; i <= bottomRightCoords[0]; ++i){
    for (j = topLeftCoords[1]; j <= bottomRightCoords[1]; ++j) {
      total += matrix[i][j]
    }
  }
  return total
};

Algorithms.merge = function (left, right) {
  let result = []
  while (left.length > 0 && right.length > 0) {
    if (left[0] < right[0]) { result.push(left.shift()) }
    else { result.push(right.shift()) }
  }
  result = result.concat(left)
  result = result.concat(right)
  return result
};

Algorithms.merge_sort = array => {
  if (array.length <= 1) { return array }
  let mid = Math.floor(array.length / 2)
  let left = array.slice(0, mid)
  let right = array.slice(mid, array.length)
  return Algorithms.merge(Algorithms.merge_sort(left), Algorithms.merge_sort(right))
};

Algorithms.binary_search = (array, target) => {
  if (array.length === 0) {
    if (array[0] === target) { return 0 }
    else { return null }
  }
  let mid = Math.floor(array.length / 2)
  let left = array.slice(0, mid)
  let right = array.slice(mid + 1, array.length)
  if (target < array[mid]) { return Algorithms.binary_search(left, target) }
  else if (target === array[mid]) { return mid }
  else {
    let res = Algorithms.binary_search(right, target)
    if (res === null) { return null }
    else { return 1 + res + mid }
  }
};

Algorithms.productify = array => {
  let result = new Array(array.length)
  result = result.fill(1)
  let p1 = 1
  let p2 = 1
  let i, j
  for (i = 0; i < array.length; ++i) {
    result[i] *= p1
    p1 *= array[i]
  }
  for (j = array.length - 1; j >= 0; --j) {
    result[j] *= p2
    p2 *= array[j]
  }
  return result
};

Algorithms.subsets = array => {
  if (array.length === 0) { return [[]] }
  let prev = Algorithms.subsets(array.slice(0, array.length - 1))
  let result = []
  let n
  prev.forEach(el => {
    result.push(el)
    n = Array.from(el)
    n.push(array[array.length - 1])
    result.push(n)
  })
  return result
};


})();
