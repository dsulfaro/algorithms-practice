def replace_character_check(s1, s2):
    i = 0
    change = False
    while i < len(s1):
        if s1[i] != s2[i]:
            if change:
                return False
            else:
                change = True
        i += 1
    return True

def one_extra_character_checks(s1, s2):
    # make s1 the longer string
    if len(s2) > len(s1):
        s1, s2 = s2, s1
    i = 0
    j = 0
    change = False
    while i < len(s1) and j < len(s2):
        if s1[i] == s2[j]:
            i += 1
            j += 1
        else:
            if change:
                return False
            else:
                change = True
                j -= 1
            i += 1
            j += 1
    return True

def one_away(s1, s2):
    if abs(len(s1) - len(s2)) > 1:
        return False
    if len(s1) == len(s2):
        return replace_character_check(s1, s2)
    else:
        return one_extra_character_checks(s1, s2)

def string_compression(s):
    result = ""
    i = 0
    count = 0
    curr = s[0]
    while i < len(s):
        if s[i] == curr:
            count += 1
        else:
            result += curr + str(count)
            curr = s[i]
            count = 1
        i += 1
    result += curr + str(count)
    return result

def rotate_matrix(mat):
    n = len(mat)
    for layer in range(n / 2):
        first = layer
        last = n - 1 - layer
        for i in range (0, last):
            offset = i - first
            top = mat[first][i]
            mat[first][i] = mat[last - offset][first]
            mat[last - offset][first] = mat[last][last - offset]
            mat[last][last - offset] = mat[i][last]
            mat[i][last] = top
    return mat
