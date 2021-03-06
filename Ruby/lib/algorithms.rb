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
  length -= 1
  while length > -1
    bins = []
    26.times { |_| bins << [] }
    array.each do |word|
      bins[word[length].ord - 'a'.ord].push(word)
    end
    array = []
    bins.each do |bin|
      array.concat(bin)
    end
    length -= 1
  end
  array
end

# Given an array, write a function that will return a random index of the array.
# The chance of returning a given index will vary with the value of the element.
# Probability of i should be the ith element divided by the sum of all elements.
def weighted_random_index(array)
  hash = {}
  array.each_with_index { |el, i| hash[el] = i }
  array.length.times do |el|
    array[el].times do |val|
      array << array[el]
    end
  end
  hash[array.sample]
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
  return [[array]] if array.length == 1
  result = []
  prev_perms = permutations(array[0..-2])
  prev_perms.each do |perm|
    array.length.times do |time|
      temp = perm.dup
      temp.insert(time, array[-1])
      result << temp
    end
  end
  result
end

def array_dups1(arr)
  result = []
  arr.each_index { |i| arr[(arr[i] % arr.size)] += arr.size }
  arr.each_with_index { |el, i| result << i if el / arr.size > 1 }
  result
end

def sum_prod_of_subsets(arr)
  result = 1
  arr.each_index { |x| result *= arr[x] + 1 }
  result - 1
end

def three_way_partition(arr, a, b)
  start = 0
  back = arr.size - 1
  i = 0
  while i <= back
    if arr[i] < a
      arr[i], arr[start] = arr[start], arr[i]
      start += 1
      i += 1
    elsif arr[i] > b
      arr[i], arr[back] = arr[back], arr[i]
      back -= 1
    else
      i += 1
    end
  end
  arr
end

def local_min(arr)
  i = arr.length / 2
  if arr.length == 2
    return arr[0] > arr[1] ? 1 : 0
  end
  return i if arr[i] < arr[i + 1] && arr[i] < arr[i - 1]
  if arr[i] > arr[i - 1]
    return local_min(arr.take(i + 1))
  else
    return i + local_min(arr.drop(i))
  end
end

def fact(n)
  return 1 if n <= 1
  return n * fact(n-1)
end

def index_pairs(arr)
  hash = Hash.new(0)
  arr.each { |x| hash[x] += 1 }
  result = 0
  hash.each do |k, v|
    next if v <= 1
    result += (fact(v) / (fact(2) * fact(v - 2)))
  end
  result
end

def triple_array_sum(a,b,c,target)
  hash = {}
  a.each do |x|
    hash[x] = true
  end
  b.each do |y|
    c.each do |z|
      return true if hash[target - (y + z)]
    end
  end
  false
end

def arithmetic_progression(arr)
  small1 = 1000000
  small2 = 1000000
  arr.each { |x| small1 = x if x < small1 }
  arr.each { |x| small2 = x if (x < small2 && x != small1) }
  diff = small2 - small1
  hash = {}
  arr.each do |x|
    return false if hash[x]
    hash[x] = true
  end
  start = small1
  until start >= arr.max
    start += diff
    return false unless hash[start]
  end
  true
end

def two_equal_subarrays(arr)
  sum = arr.inject(:+)
  left = 0
  arr.each_with_index do |x, i|
    left += x
    right = sum - left
    if (left * (arr.length - i - 1) == (right * (i + 1))) && (right != 0) && (left != 0)
     return true
    end
  end
  false
end

def min_pair_product_sum(arr)
  arr.sort!
  result = []
  i = 0
  j = arr.size - 1
  while i < j
    result << arr[j]
    result << arr[i]
    i += 1
    j -= 1
  end
  arr = result
end

def dot_prod(a, b)
  dp = Array.new(b.size + 1) { Array.new(a.size, 0) }
  i = 1
  while i <= b.size
    j = i
    while j <= a.size
      dp[i][j] = [dp[i-1][j-1] + (a[j-1] * b[i-1]), dp[i][j-1]].max
      j += 1
    end
    i += 1
  end
  dp[b.size][a.size]
end

def summ(n)
  return 1 if n == 1
  n + summ(n-1)
end

def subsets_max(arr, k)
  x = arr.count{ |el| el <= k}
  summ(arr.size) - summ(x)
end

def range_occurrences(l, r)
  arr = Array.new(20, 0)
  i = 0
  while i < l.size
    arr[l[i]] += 1
    arr[r[i] + 1] -= 1
    i += 1
  end
  sum = arr[0]
  idx = 0
  i = 1
  while i < arr.length
    arr[i] += arr[i - 1]
    if sum < arr[i]
      sum = arr[i]
      idx = i
    end
    i += 1
  end
  idx
end

def arr_cycle(arr, idx, seen)
  return false if arr[idx] % arr.size == 0 && idx != 0
  return true if seen[idx]
  seen[idx] = true
  nindex = (idx + arr[idx]) % arr.size
  arr_cycle(arr, nindex, seen)
end

def sumsets(arr, queries)
  bits = "0" * (arr.inject(:+) + 1)
  bits[0] = "1"
  arr.each do |el|
    shifted_bits = bits.to_i(2) << el
    new_bits = bits.to_i(2) | shifted_bits.to_i
    bits = new_bits.to_s(2)
  end
  queries.each do |q|
    if bits[q] == "1"
      puts "Yes"
    else
      puts "No"
    end
  end
end

def twos_compliment(bi)
  xor = "1" * bi.size
  comp = bi.to_i(2) ^ xor.to_i(2)
  comp += 1
  comp.to_s(2)
end

def gen_bin_util(result, curr, k)
  if k == 0
    result << curr
    return
  end
  if curr.length == 0
    gen_bin_util(result, "1", k - 1)
    gen_bin_util(result, "0", k - 1)
  else
    if curr[-1] != "1"
      gen_bin_util(result, curr + "1", k - 1)
    end
      gen_bin_util(result, curr + "0", k - 1)
  end
end

def gen_bin_without_ones(k)
  result = []
  gen_bin_util(result, "", k)
  result
end

def mat_rot(mat)
  master = (mat[0] * 2).join
  mat.each { |row| return false unless master.include?(row.join) }
  true
end

def sub_replace?(str, k)
  return false unless str.length % k == 0
  store = Hash.new(0)
  str.scan(/.{#{k}}/).each { |s| store[s] += 1 }
  store.keys.length == 2 && store.values.include?(1)
end

def make_palindrome(str)
  subs = uniq_subs(str).select{ |x| x == x.reverse }
  str.length - subs.max_by(&:length).length
end

class String
  def my_to_i
    result = 0
    tens = 1
    self.reverse.each_char do |c|
      next unless c.ord.between?(48, 57)
      x = (c.ord - '0'.ord) * tens
      if x == 0
        result *= 10
      else
        result += x
      end
      tens *= 10
    end
    result *= -1 if self[0] == "-"
    result
  end

  def urlify
    x = "%20"
    result = ""
    self.each_char { |c| result << ((c == " ") ? x : c) }
    result
  end

end

def rev_sent(str)
  words = []
  word = ""
  str.each_char do |c|
    if c == " "
      words << word
      word = ""
    else
      word += c
    end
  end
  words << word
  result = ""
  i = words.length - 1
  while i >= 0
    result += words[i]
    result += " " unless i == 0
    i -= 1
  end
  result
end

def rem_dups(str)
  hash = Hash.new(false)
  result = ""
  str.each_char do |c|
    result << c unless hash[c]
    hash[c] = true
  end
  result
end

def partition(arr, left, right)
  x = arr[right]
  i = left
  arr.each_with_index do |el, j|
    next if j < left
    break if j == right
    if el <= x
      arr[i], arr[j] = arr[j], arr[i]
      i += 1
    end
  end
  arr[i], arr[right] = arr[right], arr[i]
  return i
end

def kth_smallest_on2(arr, left=0, right=arr.size-1, k)
  if k > 0 && k <= right - left + 1
    pos = partition(arr, left, right)
    if pos - left == k - 1
      return arr[pos]
    end
    if pos - left > k - 1
      return kth_smallest_on2(arr, left, pos-1, k)
    end
    return kth_smallest_on2(arr, pos+1, right, k-pos+left-1)
  end
  return -1
end

def first_repeat(arr)
  hash = {}
  arr.each_with_index do |el, i|
    hash[el] = [] unless hash[el]
    hash[el] << i
  end
  repeats = hash.select { |k, v| v.length > 1 }
  return nil if repeats.empty?
  repeats.first[0]
end

def first_non_repeat(arr)
  hash = Hash.new(0)
  arr.each_with_index { |el, i| hash[el] += 1 }
  hash.each { |k, v| return k if v == 1}
end

def smallest_integer(arr)
  result = 1
  i = 0
  while i < arr.size && arr[i] <= result
    result += arr[i]
    i += 1
  end
  result
end

def move_negatives(arr)
  i = 0
  j = arr.size - 1
  while i < j
    if arr[i] < 0
      i += 1
    elsif arr[j] < 0
      arr[i], arr[j] = arr[j], arr[i]
      i += 1
      j -= 1
    else
      j -= 1
    end
  end
  arr
end

def subarray_zero(arr)
  set = []
  curr = 0
  arr.each do |el|
    curr += el
    return true if set.include?(curr) || curr == 0
    set << curr
  end
  false
end

a = [-3, 2, 3, 1, 6]
p subarray_zero(a)
