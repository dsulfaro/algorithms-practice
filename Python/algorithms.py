import string

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
