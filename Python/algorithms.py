import string
import random
import pdb

def digital_root(number):
    return number % 9

def caesar_cipher(string, shift):
    result = ""
    for c in string:
        num = ord(c) - 96
        num = (num + shift) % 26
        result += chr(num + 96)
    return result

def common_substrings(s, t):
    result = ""
    if (len(s) > len(t)):
        s, t = t, s
    for i, val in enumerate(s):
        for j, xal in enumerate(s):
            if j <= i:
                continue
            else:
                sub = s[i:j]
                if (sub in t) and (len(sub) > len(result)):
                    result = sub
    return result

def sum_rec(l):
    if len(l) == 0:
        return 0
    else:
        return l[0] + sum_rec(l[1:])

def fibs(n):
    if n == 1:
        return [0]
    elif n == 2:
        return [0, 1]
    else:
        prev_fibs = fibs(n - 1)
        new_fib = prev_fibs[-1] + prev_fibs[-2]
        prev_fibs.append(new_fib)
        return prev_fibs

def is_palindrome(str):
    return str == str[::-1]

def valid_ip(str):
    chars = str.split(".")
    if len(chars) != 4:
        return False
    for c in chars:
        try:
            x = int(c)
        except ValueError:
            return False
        if int(c) < 0 or int(c) > 255:
            return False
    return True

def folding_cipher(str):
    result = ""
    alpha = list(string.ascii_lowercase)
    for i, c in enumerate(str):
        idx = alpha.index(c)
        result += alpha[26 - idx - 1]
    return result

def uniq_subs(str):
    result = set()
    for i, _ in enumerate(str):
        for j, _ in enumerate(str):
            if j < i:
                continue
            else:
                result.add(str[i:j + 1])
    return list(result)

def lcs(l):
    m = 0
    c = 0
    for x in l:
        c += x
        if c > m:
            m = c
        if c < 0:
            c = 0
    return m

def silly_years(year):
    result = []
    while len(result) != 10:
        year = str(year)
        first = year[0:2]
        middle = year[1:3]
        last = year[2:]
        if int(first) + int(last) == int(middle):
            result.append(int(year))
        year = int(year) + 1
    return result

def pair_sum(arr, k):
    seen = set()
    result = []
    for x in arr:
        if (k - x) in seen:
            result.append([x, (k - x)])
            seen.remove(k - x)
        seen.add(x)
    return result

def matrix_region_sum(matrix, top_left, bottom_right):
    total = 0
    i = top_left[0]
    while i <= bottom_right[0]:
        j = top_left[1]
        while j <= bottom_right[1]:
            total += matrix[i][j]
            j += 1
        i += 1
    return total

def merge_sort(arr):
    if len(arr) == 1:
        return arr
    mid = len(arr) / 2
    left = arr[:mid]
    right = arr[mid:]
    return merge(merge_sort(left), merge_sort(right))

def merge(left, right):
    result = []
    while len(left) > 0 and len(right) > 0:
        if left[0] > right[0]:
            result.append(right[0])
            right = right[1:]
        else:
            result.append(left[0])
            left = left[1:]
    result += left
    result += right
    return  result

def binary_search(array, target):
    if len(array) == 0:
        return -1
    if len(array) == 1:
        if array[0] == target:
            return 0
        else:
            return -1
    mid = len(array) / 2
    left = array[:mid]
    right = array[(mid + 1):]
    if array[mid] == target:
        return mid
    elif array[mid] > target:
        return binary_search(left, target)
    else:
        ret = binary_search(right, target)
        if ret == -1:
            return -1
        else:
            return 1 + mid + ret

def productify(array):
    result = [1] * len(array)
    prod1 = 1
    for i, x in enumerate(array):
        result[i] *= prod1
        prod1 *= array[i]
    prod2 = 1
    for j, y in reversed(list(enumerate(array))):
        result[j] *= prod2
        prod2 *= array[j]
    return result

def subsets(array):
    if len(array) == 0:
        return [[]]
    else:
        result = []
        prev_subs = subsets(array[:-1])
        for sub in prev_subs:
            temp = sub[:]
            sub.append(array[-1])
            result.append(temp)
            result.append(sub)
        return result

def longest_palindrome(str):
    max = ""
    for i, ch in enumerate(str):
        for j, c in enumerate(str):
            if j < i:
                continue
            sub = str[i:j+1]
            if is_palindrome(sub) and len(sub) > len(max):
                max = sub
    return max

def fast_intersection(arr1, arr2):
    seen = set()
    for el in arr1:
        if type(el) == list:
            seen.add(tuple(el))
        else:
            seen.add(el)
    result = []
    for el in arr2:
        if type(el) == list:
            if tuple(el) in seen:
                result.append(el)
        else:
            if el in seen:
                result.append(el)
    return result

def common_subsets(arr1, arr2):
    subs1 = tuple(subsets(arr1))
    subs2 = tuple(subsets(arr2))
    return fast_intersection(subs1, subs2)

def can_win(arr, idx, seen):
    if idx >= len(arr) or idx < 0:
        return False
    if arr[idx] == 0:
        return True
    if idx in seen:
        return False
    seen[idx] = True
    forward = idx + arr[idx]
    backward = idx - arr[idx]
    return can_win(arr, backward, seen) or can_win(arr, forward, seen)

def strings_sort(array, length):
    length -= 1
    while length > -1:
        bins = [[] for i in range(27)]
        for word in array:
            bins[ord(word[length]) - ord('a')].append(word)
        array = []
        for section in bins:
            array.extend(section)
        length -= 1
    return array

def weighted_random_index(array):
    store = {}
    for i, el in enumerate(array):
        store[el] = i
    for i in range(len(array)):
        for j in range(array[i]):
            array.append(array[i])
    return store[random.choice(array)]

def move_zeros(array):
    i = 0
    j = len(array) - 1
    while i < j:
        while array[j] == 0:
            j -= 1
        if array[i] == 0:
            array[i], array[j] = array[j], array[i]
        i += 1
    return array

def group_array(array):
    result = []
    sub = [array[0]]
    i = 1
    while i < len(array):
        if array[i] != sub[0]:
            result.append(sub)
            sub = [array[i]]
        else:
            sub.append(array[i])
        i += 1
    result.append(sub)
    return result

def look_and_say(array):
    result = []
    groups = group_array(array)
    for group in groups:
        result.append([len(group), group[0]])
    return result

def sum_upon_sums(array):
    n = len(array)
    summation = (n * (n + 1)) / 2
    for el in array:
        summation -= el
    return summation

class MaxStack(object):

    def __init__(self):
        self.store = []
        self.max_vals = []

    def push(self, val):
        self.store.append(val)
        if len(self.store) == 1:
            self.max_vals.append(val)
        else:
            if val > self.max():
                self.max_vals.append(val)
            else:
                self.max_vals.append(self.max_vals[-1])
        return val

    def pop(self):
        self.store.pop()
        return self.max_vals.pop()

    def max(self):
        if self.empty():
            return "MaxStack is empty"
        else:
            return self.max_vals[-1]

    def empty(self):
        if len(self.store) == 0:
            return True
        else:
            return False

    def display(self):
        if self.empty():
            print ("MaxStack is empty")
        else:
            string = "Stack: "
            for el in self.store:
                string = string + str(el) + " "
            print (string)
            string = "Max value: " + str(self.max())
            print (string)

class MinMaxStack(object):

    def __init__(self):
        self.store = []
        self.max = []
        self.min = []

    def empty(self):
        return True if self.size() == 0 else False

    def peek(self):
        return self.store[-1] if not (self.empty()) else self.empty_message()

    def push(self, val):
        self.store.append(val)
        if len(self.max) == 0:
            self.max.append(val)
            self.min.append(val)
        else:
            self.max.append(val) if val > self.max[-1] else self.max.append(self.max[-1])
            self.min.append(val) if val < self.min[-1] else self.min.append(self.min[-1])

    def pop(self):
        if self.empty():
            self.empty_message()
        else:
            if len(self.max) > 0:
                self.max.pop()
            if len(self.min) > 0:
                self.min.pop()
            return self.store.pop()

    def max_el(self):
        return self.max[-1] if not self.empty() else self.empty_message()

    def min_el(self):
        return self.min[-1] if not self.empty() else self.empty_message()

    def size(self):
        return len(self.store)

    def empty_message(self):
        print ("Stack is empty")

class MinMaxStackQueue(object):

    def __init__(self):
        self.left = MinMaxStack()
        self.right = MinMaxStack()

    def empty(self):
        return True if self.size() == 0 else False

    def size(self):
        return len(self.left) + len(self.right)

    def enqueue(self, val):
        self.left.push(val)

    def dequeue(self):
        if self.right.size() == 0:
            self.right.store = list(reversed(self.left.store))
            self.right.max = list(reversed(self.left.max))
            self.right.min = list(reversed(self.left.min))
            self.left.max = []
            self.left.min = []
            self.left.store = []
        else:
            self.right.max.pop()
            self.right.min.pop()
        return self.right.pop()

    def max_el(self):
        if not self.right.empty() and not self.left.empty():
            return max([max(self.left.store), max(self.right.store)])
        if self.left.empty():
            return max(self.right.store)
        elif self.right.empty():
            return max(self.left.store)

    def min_el(self):
        if self.left.empty():
            return min(self.right.store)
        elif self.right.empty():
            return min(self.left.store)
        else:
            return min([min(self.left.store), min(self.right.store)])

    def display(self):
        print self.left.store
        print self.right.store

def windowed_max_range(array, w):
    window = MinMaxStackQueue()
    for i in range(w):
        window.enqueue(array[i])
    result = window.max_el() - window.min_el()
    while w < len(array):
        window.dequeue()
        window.enqueue(array[w])
        candidate = window.max_el() - window.min_el()
        if candidate > result:
            result = candidate
        w += 1
    return result

def file_list(files):
    result = []
    for key, val in files.iteritems():
        if val == True:
            result.append(key + '/')
        else:
            sub_files = file_list(val)
            for f in sub_files:
                result.append(key + '/' + f)
    return result

def find_missing_number(arr1, arr2):
    return sum(arr1) - sum(arr2)

def is_shuffle(string_one, string_two, string_three):
    if len(string_three) == 0:
        return True
    if len(string_one) > 0 and string_one[0] == string_three[0]:
        return is_shuffle(string_one[1:], string_two, string_three[1:])
    if len (string_two) > 0 and string_two[0] == string_three[0]:
        return is_shuffle(string_one, string_two[1:], string_three[1:])
    return False
