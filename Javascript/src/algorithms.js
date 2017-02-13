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

};

// Write a function which returns the first n elements from the fibonnacci sequence, given n.
Algorithms.fibs = function (number) {

};

// Write a function that takes a string and returns true if it's a palindrome, false if it's not.
// Your solution should take less time and memory than rebuilding the string backward and comparing the two.
Algorithms.isPalindrome = function (string) {

};

// Implement the Folding Cipher.
// It folds the alphabet in half and uses the adjacent letter.
// a <=> z, b <=> y, c <=> x, m <=> n.
Algorithms.foldingCipher = function (string) {

};

// Write a method that finds all the unique substrings for a word.
Algorithms.uniqSubs = function (string) {

};


// Given an array of integers (positive and negative) find the largest contiguous subsum (sum of a subarray).
// You can solve this trivially in O(n**2) time by considering all subarrays.
// Try to solve it in O(n) time with O(1) memory.
Algorithms.lcs = function (array) {

};

// Write a function that takes a year (four digit integer) and returns an array with the 10 closest subsequent years that meet the following condition:
// the first two digits summed with the last two digits are equal to the middle two digits.
Algorithms.sillyYears = function (number) {

};

// Given an array of integers, return all pairs that sum up to a specified value k.
// List the pairs in [min, max] order.
// Time complexity: O(n).
// Return an array.
Algorithms.pairSum = function (array, k) {

};

// Given a matrix of integers and coordinates of a rectangular region within the matrix.
// Find the sum of numbers falling inside the rectangle.
// Time complexity: O(number of rows * number of columns).
Algorithms.matrixRegionSum = function (matrix, topLeftCoords, bottomRightCoords) {

};

Algorithms.merge = function (left, right) {

};

Algorithms.merge_sort = array => {

};

Algorithms.binary_search = (array, target) => {

};

Algorithms.productify = array => {

};

Algorithms.subsets = array => {

};


})();
