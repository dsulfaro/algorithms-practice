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
