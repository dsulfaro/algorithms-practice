require 'set'
require 'byebug'
# Write a method that will sum the digits of a positive integer.
# If it is greater than or equal to 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result.
# The result is called a 'digital root'.
# Do not use string conversion within your method.
def digital_root(number)
  number % 9
end

# Write a function that takes a message and an increment amount.
# Output the same letters shifted by that amount in the alphabet.
# Assume lowercase and no punctuation.
# Preserve spaces.
def caesar_cipher(string, shift)
  alphabet = ('a'..'z').to_a
  result = ""
  string.each_char { |char| char == ' ' ? result << ' ' :
                     result << alphabet[((alphabet.index(char) + shift) % 26)] }
  result
end

# Write a function that takes two strings.
# Return the longest common substring.
def common_substrings(string_one, string_two)
  string_one, string_two = string_two, string_one if string_one.length > string_two.length
  result = ""
  (0...string_one.length).each do |i|
    (i...string_two.length).each do |j|
      if string_two.include?(string_one[i..j]) && string_one[i..j].length > result.length
        result = string_one[i..j]
      end
    end
  end
  result
end

# Write a function that takes an array of integers and returns their sum.
# Use recursion.
def sum_rec(numbers)
  return 0 if numbers.empty?
  return numbers.first if numbers.size == 1
  numbers.shift + sum_rec(numbers)
end

# Write a function that takes n, the length of the sequence.
# Return the first n elements from the fibonnacci sequence as an array.
def fibs(n)
  return [0] if n == 1
  return [0, 1] if n == 2
  prev_fibs = fibs(n - 1)
  next_fib = prev_fibs[-1] + prev_fibs[-2]
  prev_fibs << next_fib
end

# Write a function that takes a string.
# Return true if the string is a palindrome, otherwise return false.
# It should take less time and memory than reversing the string.
def is_palindrome?(string)
  i = 0
  while i < string.length / 2
    return false if string[i] != string[string.length - 1 - i]
    i += 1
  end
  true
end

# Write a method that takes a string as input.
# It should return true if the input is a valid IPv4 address.
# Valid IPs are anything between '0.0.0.0' and '255.255.255.255'.
def valid_ip?(string)
  string.split('.').each do |num|
    return false if num.to_i < 0 || num.to_i > 255
  end
  true
end

# Implement the Folding Cipher.
# It folds the alphabet in half and uses the adjacent letter.
# a -> z, b -> y, c -> x, m -> n, etc...
def folding_cipher(string)
  alpha = ('a'..'z').to_a
  i = 0
  while i < string.length
    string[i] = alpha[26 - alpha.index(string[i]) - 1]
    i += 1
  end
  string
end

# Write a method that finds all the unique substrings for a word.
def uniq_subs(string)
  set = Set.new()
  string.chars.each_index do |i|
    string.chars.each_index do |j|
      next if j < i
      set.add(string[i..j])
    end
  end
  set.to_a
end

# Given an array of integers find the largest contiguous subsum.
# You can solve this trivially in O(n**2) time by considering all subarrays.
# Try to solve it in O(n) time with O(1) memory.
def lcs(array)
  max = 0
  current = 0
  array.each do |el|
    current += el
    max = current if current > max
    current = 0 if current < 0
  end
  max
end

# Write a function that takes a year as a four digit integer.
# Returns an array of the 10 closest subsequent silly years.
# A silly year's first two digits plus the last two digits equal the middle two.
def silly_years(year)
  result = []
  until result.size == 10
    year += 1
    string_year = year.to_s
    first = string_year[0..1].to_i
    middle = string_year[1..2].to_i
    last = string_year[2..3].to_i
    result << year if first + last == middle
  end
  result
end

# Take an array of integers, and integer k.
# Return all pairs that sum to k exactly.
# List the pairs in [min, max] order.
# Time complexity: O(n).
# Return a set.
def pair_sum(array, k)
  seen = Set.new()
  result = Set.new()
  array.each do |el|
    result << [el, k - el] if seen.include?(el)
    seen.add(k - el)
  end
  result
end

# Take a matrix of integers and coordinates.
# The coordinates represent a rectangular region within the matrix
# Find the sum of numbers falling inside the rectangle.
# Time complexity: O(number of rows * number of columns).
def matrix_region_sum(matrix, top_left_coords, bottom_right_coords)
  total = 0
  i = top_left_coords[0]
  while (i <= bottom_right_coords[0])
    j = top_left_coords[1]
    while j <= bottom_right_coords[1]
      total += matrix[i][j]
      j += 1
    end
    i += 1
  end
  total
end

# Implement Merge Sort
# Hint: This typically involves a helper function.
def merge_sort(array)
  return array if array.length <= 1
  middle = array.length / 2
  merge(merge_sort(array.take(middle)), merge_sort(array.drop(middle)))
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    case left.first <=> right.first
    when -1
      result << left.shift
    when 0
      result << left.shift
    when 1
      result << right.shift
    end
  end
  result.concat(left)
  result.concat(right)
  result
end

# Implement binary search.
# Return nil if the target isn't found.
def binary_search(array, target)
  return nil if array.empty?
  mindex = array.length / 2
  case target <=> array[mindex]
  when -1
    binary_search(array.take(mindex), target)
  when 0
    mindex
  when 1
    result = binary_search(array.drop(mindex + 1), target)
    (result.nil?) ? nil : (mindex + 1) + result
  end
end

# You are given a list of numbers in an array.
# Replace all the numbers with the product of all other numbers.
# Do this in O(n) time without using division.
def productify(array)
  result = Array.new(array.length, 1)
  prod1 = 1
  (0..(array.length - 1)).each do |i|
    result[i] *= prod1
    prod1 *= array[i]
  end
  prod2 = 1
  (array.length - 1).downto(0) do |j|
    result[j] *= prod2
    prod2 *= array[j]
  end
  result
end

# Write a function that takes an array and returns all of its subsets.
def subsets(array)
  return [[]] if array.empty?
  prev = subsets(array[0..-2])
  newer = prev.map { |el| el + [array.last] }
  prev + newer
end

# Return the indices of the start/end of the longest palindrome in the string.
# You could reverse the string and compare it to the original, but that is slow.
# Instead, you should be able to solve the problem with O(1) memory.
def longest_palindrome(string)
  max = ""
  idx = nil
  string.chars.each_index do |i|
    string.chars.each_index do |j|
      next if j <= i
      sub = string[i..j]
      if (sub == sub.reverse && sub.length > max.length)
        max = sub
        idx = [i, j]
      end
    end
  end
  idx
end

# Given two arrays, find the intersection of both sets.
# It should be trivial to write an O(n**2) solution.
# Use sorting to solve in O(nlog(n)).
# Next, improve this to O(n) time (maybe use a non-array datastructure).
def fast_intersection(array_one, array_two)
  set = Set.new();
  array_one.each { |x| set.add(x) }
  result = []
  array_two.each { |y| result << y if set.include?(y) }
  result
end

# Write a function that takes two arrays of integers
# Returns an array with all the subsets commmon to both arrays.
# Don't generate all subsets of both arrays, which would be exponential time.
# Instead, directly generate the subsets of both.
def common_subsets(array_one, array_two)
  subsets(fast_intersection(array_two, array_one))
end

# You are given an array and index.
# Find if it's possible to reach 0 by starting at the index.
# You can only move left or right by the distance found at array[index].
def can_win?(arr, index = 0, seen = {})
  return false if !index.between?(0, arr.length - 1) || seen[index]
  return true if arr[index] == 0
  seen[index] = true
  can_win?(arr, index + arr[index], seen) || can_win?(arr, index - arr[index], seen)
end

# Assume an array of length n, containing the numbers 1..n in jumbled order.
# "Sort" this array in O(n) time.
# Hint: You should be able to do this without looking at the input.
def sort1(array)
  (1..array.size).to_a
end

# Assume an array of length n with numbers in the range 1..N (N >= n).
# Sort this array in O(n + N) time.
# You may use O(N) memory.
def sort2(array, max_value)
  array.sort
end

# Say I give you an array of n strings, each of length k.
# Merge sort can sort this in O(knlog(n)).
# Sort the strings in O(kn).
# Hint: Do not compare any two strings.
# All strings contain only lowercase letters without whitespace or punctuation.
def sort3(array, length)

end

# Given an array, write a function that will return a random index of the array.
# The chance of returning a given index will vary with the value of the element.
# Probability of i should be the ith element divided by the sum of all elements.
def weighted_random_index(array)

end

# Given an array, move all zeros to the end.
# The order of non-zero elements does not matter.
# Try to accomplish this in O(n) time and O(1) space.
def move_zeros(array)
  i = 0
  j = array.length - 1
  while i != j && i < j
    while array[j] == 0 && j > i
      j -= 1
    end
    if array[i] == 0
      array[i], array[j] = array[j], array[i]
      j -= 1
    end
    i += 1
  end
  array
end

# Implement the 'look and say' function.
#'Look and say' takes an input array and outputs an array.
# The output describes the count of the elements in the input.

def look_and_say(array)
  result = []
  i = 0
  count = 0
  current = array.first
  while i < array.length
    if current != array[i]
      result << [count, current]
      current = array[i]
      count = 1
    else
      count += 1
    end
    i += 1
  end
  result << [count, current]
  result
end

# I give you a scrambled list of n unique integers between 0 and n.
# Tell me what number is missing?
# How could you solve the problem in O(n), and also O(1) space?
def sum_upon_sums(array)
  n = array.size
  total = (n * (n + 1)) / 2
  array.each do |el|
    total -= el
  end
  total
end

# Implement a stack with a max method that returns the maximum value.
# It should run in O(1) time.
class MaxStack

  def initialize
    @store = []
    @max = []
  end

  def push(val)
    @store << val
    if @max.empty?
      @max << val
    else
      @max.last > val ? @max << @max.last : @max << val
    end
  end

  def pop
    @max.pop
    @store.pop
  end

  def max
    @max.last
  end
end

# Implement a queue using stacks.
# That is, write enqueue and dequeue using only push and pop operations.
# In terms of performance, enqueue should be O(1).
# Dequeue may be worst-case O(n).
# In terms of ammortized time, dequeue should be O(1).
# Prove that your solution accomplishes this.
class MyStack
  def initialize(store = [])
    @store = store
  end

  def empty?
    @store.empty?
  end

  def peek
    @store.last
  end

  def pop
    @store.pop
  end

  def push(val)
    @store.push(val)
  end

  def size
    @store.size
  end
end

class StackQueue
  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def empty?
    @in_stack.empty? && @out_stack.empty?
  end

  def size
    @in_stack.size + @out_stack.size
  end

  def enqueue(val)
    # O(1)
    @in_stack.push(val)
  end

  def dequeue
    queueify if @out_stack.empty?
    # If we haven't already reversed the stack, this runs in O(n). However, we
    # only have to do this once for every n dequeue operations, so it amortizes
    # to O(1)

    @out_stack.pop
  end

  private
  def queueify
    # How do you turn a stack into a queue? Flip it upside down.
    @out_stack.push(@in_stack.pop) until @in_stack.empty?
  end
end

# Take an array, and a window size w.
# Find the maximum max - min within a range of w elements.
# First solve MaxStack.
# Write a MinMaxStack to track both the min and the max in a stack.
# Next, solve StackQueue.
# Write a MinMaxStackQueue which tracks both the min and max.
# Last, use MinMaxStackQueue to solve the problem.
class MinMaxStack
  def initialize
    @store = MyStack.new
  end

  def length
    @store.length
  end

  def empty?
    @store.empty?
  end

  def min
    @store.peek[:min] unless empty?
  end

  def max
    @store.peek[:max] unless empty?
  end

  def peek
    @store.peek[:value] unless empty?
  end

  def pop
    @store.pop[:value] unless empty?
  end

  def push(val)
    # By using a little extra memory, we can get the max simply by peeking,
    # which is O(1).
    @store.push({
      max: new_max(val),
      min: new_min(val),
      value: val
    })
  end

  def size
    @store.size
  end

  private

  def new_max(val)
    empty? ? val : [max, val].max
  end

  def new_min(val)
    empty? ? val : [min, val].min
  end
end

class MinMaxStackQueue
  def initialize
    @in_stack = MinMaxStack.new
    @out_stack = MinMaxStack.new
  end

  def dequeue
    queueify if @out_stack.empty?
    @out_stack.pop
  end

  def enqueue(val)
    @in_stack.push(val)
  end

  def length
    @in_stack.length + @out_stack.length
  end

  def empty?
    @in_stack.empty? && @out_stack.empty?
  end

  def max
    # At most two operations; O(1)
    maxes = []
    maxes << @in_stack.max unless @in_stack.empty?
    maxes << @out_stack.max unless @out_stack.empty?
    maxes.max
  end

  def min
    mins = []
    mins << @in_stack.min unless @in_stack.empty?
    mins << @out_stack.min unless @out_stack.empty?
    mins.min
  end

  def size
    @in_stack.size + @out_stack.size
  end

  private
  def queueify
    @out_stack.push(@in_stack.pop) until @in_stack.empty?
  end
end

def windowed_max_range(array, w)
  window = MinMaxStackQueue.new
  w.times { |i| window.enqueue(array[i]) }
  max = window.max - window.min
  while w < array.length
    window.dequeue
    window.enqueue(array[w])
    max = window.max - window.min if (window.max - window.min) > max
    w += 1
  end
  max
end

# Suppose a hash representing a directory.
# All keys are strings with names for either folders or files.
# Keys that are folders point to nested hashes.
# Keys that are files point to "true".
# Write a function that takes such a hash.
# Return an array of strings with the path to each file in the hash.
def file_list(hash)
  result = []
  hash.each do |k, v|
    if v == true
      result << k
    else
      temp = file_list(v)
      if temp.class == Array
        temp.each do |x|
          result << k + '/' + x
        end
      else
        result << k + '/' + temp
      end
    end
  end
  result
end

# Assume an array of non-negative integers.
# A second array is made by shuffling the first and deleting a random element.
# Given these two arrays, find which element is missing in the second array.
# Do this in linear time with constant memory use.
def find_missing_number(array_one, array_two)
  array_one.inject(:+) - array_two.inject(:+)
end

# Create a function that takes three strings.
# Return whether the third is an interleaving of the first two.
# Interleaving means it contains the same characters and preserves their order.
def is_shuffle?(string_one, string_two, string_three)
  return true if string_one.empty? && string_two.empty? && string_three.empty?
  if string_one[0] == string_three[0]
    is_shuffle?(string_one[1..-1], string_two, string_three[1..-1])
  elsif string_two[0] == string_three[0]
    is_shuffle?(string_one, string_two[1..-1], string_three[1..-1])
  else
    return false
  end
end

# Write a function that takes an integer and returns it in binary form.
def binary(integer)
  integer.to_s(2)
end

# Write a recursive function that takes a number and returns its factorial.
def recursive_factorial(number)
  return 1 if number <= 1
  number * recursive_factorial(number - 1)
end

# Write an iterative function that takes a number and returns its factorial.
def iterative_factorial(number)
  total = 1
  while number > 0
    total *= number
    number -= 1
  end
  total
end

# Write a method that takes an array and returns all its permutations.
def permutations(array)
  return [1] if array.length == 1
end
