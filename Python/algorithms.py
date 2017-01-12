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
